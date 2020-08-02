



import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'FavoriteEvent.dart';
import 'FavortieState.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  List<Product> listdata = [];
  int currentPage = 1;


  @override
  // TODO: implement initialState
  FavoriteState get initialState =>
      Initial( data: []);

  @override
  Stream<FavoriteState> mapEventToState(event) async* {
    if(event is FavoriteLoadEvent)
      {
        currentPage=1;
        listdata=[];
        yield Loading(data: listdata);
        QueryResult result = await _client.query(
            QueryOptions(
                documentNode: gql(getFavorites),
                variables:
                {
                  "person_id" : event.person_id

                }
            )

        );

        if(!result.hasException) {
          List<LazyCacheMap> list_to_add =
          (result.data["getFavorites"] as List<dynamic>).cast<LazyCacheMap>();


          for (int i = 0; i < list_to_add.length; i++) {



            listdata.add(new Product(
                list_to_add[i]["_id"],
                list_to_add[i]["name"],
                list_to_add[i]["img_url"],
                list_to_add[i]["price"],
                list_to_add[i]["promotion_percent"],
                list_to_add[i]["final_price"],
                null,
                list_to_add[i]["stock_status"],
                list_to_add[i]["record_status"]));
          }
          currentPage++;
        }
        if(state is FavoriteLoadedState)
          yield FavoriteLoaded2State(data: listdata);
        else    yield FavoriteLoadedState(data: listdata);
      }




    if(event is actionFavoriteEvent)
      {
        QueryResult result = await _client.mutate(
            MutationOptions(
                documentNode: gql(actionFavorite),
                variables:
                {
                  "person_id": event.person_id,
                  "product_id": event.product_id,


                }
            )
        );
        if(!result.hasException)
        {

          listdata.removeAt(event.index);

        }
        if(state is FavoriteLoadedState)
          yield FavoriteLoaded2State(data: listdata);
        else    yield FavoriteLoadedState(data: listdata);
      }

  }
}