
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


import 'SearchEvent.dart';
import 'SearchState.dart';
GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  List<Product> listdata = [];
  int currentPage = 1;



  @override
  // TODO: implement initialState
  SearchState get initialState =>
      SearchGridViewState(
          data: [],SortBy: 0);

  @override
  Stream<SearchState> mapEventToState(event) async* {
    if(event is SearchLoadEvent)
    {  print("Searchgetmoredata event");
    print(event.text);
    yield SearchLoading(data:state.data,SortBy: state.SortBy);
    listdata = [];
    currentPage=1;
    QueryResult result = await _client.query(
        QueryOptions(
            documentNode: gql(searchProduct),
            variables:
            {
              "text" : event.text,
              "pageNumber": currentPage,
              "sort": event.SortBy==null?state.SortBy:event.SortBy

            }
        )

    );
    if(!result.hasException) {
      List<LazyCacheMap> list_to_add =
      (result.data["searchProduct"]["products"] as List<dynamic>).cast<LazyCacheMap>();


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

      yield SearchGridViewState(data: listdata,SortBy:event.SortBy==null? state.SortBy:event.SortBy);
    }
    if(event is SearchGetMoreDataEvent )
    {  // get Products from data.length-1 then add into dat
      print("Searchgetmoredata event");
      yield SearchLoading(data:state.data,SortBy: state.SortBy);
      QueryResult result = await _client.query(
          QueryOptions(
              documentNode: gql(searchProduct),
              variables:
              {
                "text" : event.text,
                "pageNumber": currentPage,
                "sort": event.SortBy==null?state.SortBy:event.SortBy
              }
          )

      );
      if(!result.hasException) {
        List<LazyCacheMap> list_to_add =
        (result.data["searchProduct"]["products"] as List<dynamic>).cast<LazyCacheMap>();


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
      if(state is SearchGridViewState)
        yield SearchAddmoreState(data: listdata,SortBy:event.SortBy==null? state.SortBy:event.SortBy);
      else
        yield SearchGridViewState(data: listdata,SortBy:event.SortBy==null? state.SortBy:event.SortBy);
    }
  }
}