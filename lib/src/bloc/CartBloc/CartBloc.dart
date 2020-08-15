


import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'CartEvent.dart';
import 'CartState.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class CartBloc extends Bloc<CartEvent, CartState> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();

  List<OrderItem> list_data = [];
   double totalPrice;
   double discount;
  @override
  // TODO: implement initialState
  CartState get initialState =>
      Initial(data: [],discount: 0,totalPrice: 0);

  @override
  Stream<CartState> mapEventToState(event) async* {
    if (event is GetCartEvent) {
      list_data=[];

      QueryResult result = await _client.query(
          QueryOptions(
              documentNode: gql(getCart),
              variables:
              {
                "person_id": event.person_id
              }
          )

      );
      if (!result.hasException) {

        List<LazyCacheMap> list_OrderItem =
        (result.data["getCarts"] as List<dynamic>).cast<LazyCacheMap>();
        //print(list_OrderItem.length);
        totalPrice=0;
         for(int i =0;i<list_OrderItem.length;i++)
           {
             list_data.add(new OrderItem(list_OrderItem[i]["_id"], (list_OrderItem[i]["product"]as dynamic)["name"], (list_OrderItem[i]["product"]as dynamic)["img_url"], (list_OrderItem[i]["product"]as dynamic)["final_price"], list_OrderItem[i]["amount"], ((list_OrderItem[i]["option_amount"] as dynamic)["option_size"]as dynamic)["name"], ((list_OrderItem[i]["option_amount"] as dynamic)["option_color"]as dynamic)["name"]));
             if(list_data[i].isChosen==true)
               {
                 totalPrice+=list_data[i].count*list_data[i].productPrice;
               }
           }

      }

      yield CartLoadedState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
    }
    if(event is UpdateCartEvent)
      {
        //yield CartLoadingState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
        QueryResult result = await _client.mutate(
            MutationOptions(
                documentNode: gql(updateCart),
                variables:
                {
                  "id" : event.id,
                  "amount": event.amount

                }
            )
        );
        if(!result.hasException)
          {
            print("updateCart Ok");
            list_data[event.index].count=event.amount;
          }
        else print("updateCart failed");
        totalPrice=0;
        for(int i =0;i<list_data.length;i++)
        {
          if(list_data[i].isChosen==true)
          {
            totalPrice+=list_data[i].count*list_data[i].productPrice;
          }
        }
        if(state is CartLoadedState)
          yield CartLoaded2State(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
        else
          yield CartLoadedState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
      }

    if(event is DeleteCartEvent)
      {

        //yield CartLoadingState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
        QueryResult result = await _client.mutate(
            MutationOptions(
                documentNode: gql(deleteCart),
                variables:
                {
                  "ids" : event.id,
                }
            )
        );
        if(!result.hasException)
        {
          print("deleteCart Ok");
          list_data.removeAt(event.index);
        }
        else print("delete fail");

        totalPrice=0;
        for(int i =0;i<list_data.length;i++)
        {
          if(list_data[i].isChosen==true)
          {
            totalPrice+=list_data[i].count*list_data[i].productPrice;
          }
        }

        if(state is CartLoadedState)
          yield CartLoaded2State(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
        else
          yield CartLoadedState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
      }
    if(event is CheckItemCartEvent)
      {
        list_data[event.index].isChosen=event.value;

        totalPrice=0;
        for(int i =0;i<list_data.length;i++)
        {
          if(list_data[i].isChosen==true)
          {
            totalPrice+=list_data[i].count*list_data[i].productPrice;
          }
        }
        if(state is CartLoadedState)
          yield CartLoaded2State(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
        else
          yield CartLoadedState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
      }

    if( event is CheckAllItemCartEvent)
      {
        for(int i=0;i<list_data.length;i++)
          {
            list_data[i].isChosen=event.value;
          }
        totalPrice=0;
        for(int i =0;i<list_data.length;i++)
        {
          if(list_data[i].isChosen==true)
          {
            totalPrice+=list_data[i].count*list_data[i].productPrice;
          }
        }
        if(state is CartLoadedState)
          yield CartLoaded2State(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
        else
          yield CartLoadedState(data: list_data,discount: state.discount,totalPrice: (totalPrice-totalPrice*state.discount).toInt());
      }
  }
}