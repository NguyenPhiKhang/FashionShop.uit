import 'package:equatable/equatable.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/order.dart';


abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}
class OrderClickEvent extends CheckoutEvent {

  final int priceShip;
  final int totalPrice;
  final String address;
  final String methodPayment;
  final List<String> carts;
  final String person_id;

  OrderClickEvent({ this.methodPayment,this.address,this.totalPrice,this.priceShip,this.carts,this.person_id});
  @override
  List<Object> get props => [person_id,carts,priceShip,totalPrice,address,methodPayment];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
