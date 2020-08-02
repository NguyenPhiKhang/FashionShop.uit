




import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailEvent.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailState.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/ProductDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
ProductDetail productDetail;

  @override
  // TODO: implement initialState
  ProductDetailState get initialState =>
      Initial(data: null);

  @override
  Stream<ProductDetailState> mapEventToState(event) async* {
    if( event is ProductDetailLoadEvent)
      {
        QueryResult result = await _client.query(
            QueryOptions(
                documentNode: gql(getProductDetail),
                variables:
                {
                  "id": event.id,
                  "person_id": event.person_id
                }
            )

        );

        if(!result.hasException) {

          List<LazyCacheMap> list_to_add =
          (result.data["getProduct"]["products"] as List<dynamic>).cast<LazyCacheMap>();

                 List<LazyCacheMap> listdata_att =
                 (
                     list_to_add[0]["attribute"] as List<dynamic>).cast<
                     LazyCacheMap>();
                 List<Attribute> list_att = [];
                 for (int j = 0; j < listdata_att.length; j++) {
                   ///add attribute
                   List<LazyCacheMap> listdata_attValue =
                   (listdata_att[j]["value"] as List<dynamic>).cast<
                       LazyCacheMap>();

                   List<AttributeValue> list_attValue = [];
                   for (int k = 0; k < listdata_attValue.length; k++) {
                     list_attValue.add(new AttributeValue(
                         listdata_attValue[k]["_id"],
                         listdata_attValue[k]["name"]));
                   }
                   list_att.add(new Attribute(
                       (listdata_att[j]["attribute"] as dynamic)["name"],
                       list_attValue));
                 }

                 ///add Optionamount
                 List<LazyCacheMap> listdata_optionAmount =
                 (list_to_add[0]["option_amount"] as List<dynamic>).cast<
                     LazyCacheMap>();

                 List<OptionAmount> list_optionAmount = [];
                 for (int j = 0; j < listdata_optionAmount.length; j++) {
                   list_optionAmount.add(new OptionAmount(
                       listdata_optionAmount[j]["_id"],
                       listdata_optionAmount[j]["option_size"],
                       listdata_optionAmount[j]["option_color"],
                       listdata_optionAmount[j]["amount"]));
                 }


                 productDetail=new ProductDetail(
                     list_to_add[0]["_id"],
                     list_to_add[0]["name"],
                     (list_to_add[0]["images"] as List<dynamic>).cast<String>(),
                     list_to_add[0]["description"],
                     list_to_add[0]["price"],
                     list_to_add[0]["promotion_percent"],
                     list_to_add[0]["final_price"],
                     null,
                     list_to_add[0]["stock_status"],
                     list_att,
                     list_optionAmount,
                     list_to_add[0]["record_status"],
                      list_to_add[0]["isFavorite"]);
//

             }
        yield ProductDetailShowState(data: productDetail);
      }
                if(event is AddtocartEvent)
                  {
                    QueryResult result = await _client.mutate(
                        MutationOptions(
                            documentNode: gql(addtoCart),
                            variables:
                            {
                              "person_id": event.person_id,
                              "product_id": event.product_id,
                              "option_amount_id":event.option_amount_id,
                              "amount": event.amount,

                            }
                        )
                    );
                    if(!result.hasException)
                      {
                        print("true");
                      }
                    else print(result.exception);
                    yield ProductDetailShowState(data: productDetail);
                  }

                if(event is FavoriteTapEvent)
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
                      print("true");
                      productDetail.isFavorite=!productDetail.isFavorite;

                    }
                  }

  }



}