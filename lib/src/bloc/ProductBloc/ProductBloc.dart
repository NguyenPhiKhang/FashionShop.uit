



import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


import 'ProductEvent.dart';
import 'ProductState.dart';
GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class ProductBloc extends Bloc<ProductEvent, ProductsState>
{
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  List<Product> listdata =[];
  int currentPage=5;


  @override
  // TODO: implement initialState
  ProductsState get initialState => ProductsGridViewState(sortBy: null,error: null,filterRules: null,data: []);

  @override
  Stream<ProductsState> mapEventToState(event) async* {
           if(event is ProductLoadEvent)
           {

              yield ProductsGridViewState(sortBy: null,error: null,filterRules: null,data: listdata);
           }
           if(event is ProductGetMoreDataEvent )
             {  // get Products from data.length-1 then add into dat
               QueryResult result = await _client.query(
                   QueryOptions(
                       documentNode: gql(getProduct),
                       variables:
                       {
                         "PageNumber": currentPage,
                       }
                   )

               );

               List<LazyCacheMap> list_to_add =
               (result.data["getProduct"] as List<dynamic>).cast<LazyCacheMap>();


               for(int i=0;i<list_to_add.length;i++)
               {
                 List<LazyCacheMap> listdata_att =
                 (
                     list_to_add[i]["attribute"] as List<dynamic>).cast<LazyCacheMap>();
                 List<Attribute> list_att=[];
                 for(int j=0;j<listdata_att.length;j++)
                   {
                     ///add attribute
                     List<LazyCacheMap> listdata_attValue =
                     (listdata_att[j]["value"] as List<dynamic>).cast<LazyCacheMap>();

                     List<AttributeValue> list_attValue =[];
                     for(int k=0;k<listdata_attValue.length;k++)
                       {
                         list_attValue.add(new AttributeValue(listdata_attValue[k]["_id"], listdata_attValue[k]["name"]));
                       }
                     list_att.add(new Attribute((listdata_att[j]["attribute"] as dynamic )["name"], list_attValue));
                   }

                    ///add Optionamount
                 List<LazyCacheMap> listdata_optionAmount =
                 (list_to_add[i]["option_amount"] as List<dynamic>).cast<LazyCacheMap>();

                List<OptionAmount> list_optionAmount =[];
                 for(int j=0;j<listdata_optionAmount.length;j++)
                   {
                     list_optionAmount.add(new OptionAmount(listdata_optionAmount[j]["option_size"], listdata_optionAmount[j]["option_color"], listdata_optionAmount[j]["amount"]));
                   }





                 listdata.add(new Product(list_to_add[i]["name"], list_to_add[i]["img_url"], (list_to_add[0]["images"] as List<dynamic>).cast<String>(), list_to_add[i]["description"], list_to_add[i]["price"],  list_to_add[i]["promotion_percent"],list_to_add[i]["final_price"], null, list_to_add[i]["stock_status"], list_to_add[i]["is_freeship"], list_att,list_optionAmount ,list_to_add[i]["record_status"]));
               }
               currentPage++;

                if(state is ProductsGridViewState)
               yield ProductsAddmoreState(data: listdata);
                else
                  yield ProductsGridViewState(data: listdata);
             }



  }






}


