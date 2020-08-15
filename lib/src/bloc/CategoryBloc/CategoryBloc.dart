import 'dart:async';

import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'CategoryEvent.dart';
import 'CategoryState.dart';





GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

List<CategoryLevel1> list_cat_1 =[];




  @override
  CategoryState get initialState => InitialState();

  @override
  Stream<CategoryState> mapEventToState(
      CategoryEvent event,
      ) async* {

    if(event is InitiateEvent)
      {
        GraphQLClient _client = graphQLConfiguration.clientToQuery();
        QueryResult result = await _client.query(
            QueryOptions(
                documentNode: gql(GetAllCategories),
            )
        );
       List<LazyCacheMap> listdata_level1 =
      (result.data["getAllCategory"] as List<dynamic>).cast<LazyCacheMap>();
//           print(listdata_level1[0].length);
//        List<LazyCacheMap> listdata_level2 =
//          (listdata_level1[0]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
//        print(listdata_level2.length);
//        List<LazyCacheMap> listdata_level3 =
//                (listdata_level2[0]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
//            print(listdata_level3.length);
//        List<CategoryLevel3> list_cat_3 =[];
//        list_cat_3.add(new CategoryLevel3("a", listdata_level3[0]["icon"]));



        for(int i =0;i < listdata_level1.length;i++)
          {
            List<LazyCacheMap> listdata_level2 =
          (listdata_level1[i]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
             List<CategoryLevel2> list_cat_2=[];
            for(int j=0;j< listdata_level2.length;j++)
              {
                List<LazyCacheMap> listdata_level3 =
                (listdata_level2[j]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
                List<CategoryLevel3> list_cat_3 =[];
                for(int k=0;k<listdata_level3.length;k++)
                  {
                    list_cat_3.add(new CategoryLevel3(listdata_level3[k]["icon"], listdata_level3[k]["name"],listdata_level3[k]["category_code"]));
                  }
                list_cat_2.add(new CategoryLevel2(listdata_level2[j]["icon"],listdata_level2[j]["image"], listdata_level2[j]["name"],listdata_level2[j]["category_code"] ,list_cat_3));

              }

              list_cat_1.add(new CategoryLevel1(listdata_level1[i]["name"], list_cat_2));
          }

                yield LoadCategories();
      }

    }


}
