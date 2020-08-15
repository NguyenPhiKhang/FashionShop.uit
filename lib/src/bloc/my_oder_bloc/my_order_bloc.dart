import 'dart:async';


import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/order.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bloc/bloc.dart';

import 'my_order_event.dart';
import 'my_order_state.dart';






GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {

  List<List<Order>> list_status_items =[
    [],[],[],[],[]
  ];




  @override
  MyOrderState get initialState => InitialState();

  @override
  Stream<MyOrderState> mapEventToState(
      MyOrderEvent event,
      ) async* {

    if(event is InitiateEvent)
    {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
          QueryOptions(
            documentNode: gql(getOrder),
            variables:
              {
                "person_id": event.person_id
              }
          )
      );
      if(!result.hasException) {
        List<LazyCacheMap> listdata =
        (result.data["getOrder"] as List<dynamic>).cast<LazyCacheMap>();
        List<Order> orders = [];
        for (int i = 0; i < listdata.length; i++) {
          List<OrderItem> listCarts = [];

          List<LazyCacheMap> listdata_carts = (listdata[i]["carts"] as List<
              dynamic>).cast<LazyCacheMap>();
          for (int j = 0; j < listdata_carts.length; j++) {
            listCarts.add(OrderItem(
                listdata_carts[j]["_id"],
                (listdata_carts[j]["product"] as dynamic)["name"],
                (listdata_carts[j]["product"] as dynamic)["img_url"],
                (listdata_carts[j]["product"] as dynamic)["final_price"],
                listdata_carts[j]["amount"],
                ((listdata_carts[j]["option_amount"] as dynamic)["option_size"] as dynamic)["name"],
                ((listdata_carts[j]["option_amount"] as dynamic)["option_color"] as dynamic)["name"],
                IsReview: listdata_carts[j]["isReview"]));
          }
          orders.add(Order(
              listdata[i]["_id"],
              listdata[i]["price_ship"],
              listdata[i]["total_price"],
              listdata[i]["address"],
              listdata[i]["method_payment"],
              listCarts,
              listdata[i]["delivery_status"],
              listdata[i]["shipping_unit"],
              listdata[i]["createdAt"]));
        }
        for (int i = 0; i < orders.length; i++) {
          switch (orders[i].deliveryStatus) {
            case "Chờ xử lí":
              list_status_items[0].add(orders[i]);
              break;
            case "Đã xác nhận":
              list_status_items[1].add(orders[i]);
              break;
            case "Đang giao":
              list_status_items[2].add(orders[i]);
              break;
            case "Đã giao":
              list_status_items[3].add(orders[i]);
              break;
            case "Hủy":
              list_status_items[4].add(orders[i]);
          }
        }
      }
      yield LoadMyOrder();
    }

  }


}
