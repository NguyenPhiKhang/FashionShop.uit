

import 'package:fashionshop/src/model/OrderItem.dart';


class Order{
  String id;
  int priceShip;
  int totalPrice;
  String address;
  String methodPayment;
  List<OrderItem> listOrderItem;
  String deliveryStatus;
  String shippingUnit;
  String createDate;

  Order(String Id,int Priceship,int TotalPrice,String Address,String MethodPayment, List<OrderItem> list, String DeliveryStatus,String ShippingUnit,String CreateDate ){
    id =Id;
    priceShip=Priceship;
    totalPrice =TotalPrice;
    address =Address;
    methodPayment =MethodPayment;
    listOrderItem =list;
    deliveryStatus =DeliveryStatus;
    shippingUnit=ShippingUnit;
    createDate =CreateDate;
  }
}