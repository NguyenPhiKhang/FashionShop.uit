import 'package:equatable/equatable.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/order.dart';

abstract class CheckoutState extends Equatable {
  final Order order;
  final String error;

  CheckoutState({
    this.order,
    this.error,
  });

  @override
  List<Object> get props => [order,error];

  @override
  bool get stringify => true;
}

class isCheckoutingState extends CheckoutState {
  isCheckoutingState({

    String error,
  }) : super(error: error);
}



class LoadingState extends CheckoutState {
  LoadingState(
  {

    String error,
  }) : super(error: error);
}

class Initial extends CheckoutState {
  Initial();
}
