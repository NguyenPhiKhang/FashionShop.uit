

import 'package:equatable/equatable.dart';
import 'package:fashionshop/src/model/OrderItem.dart';


abstract class CartState extends Equatable {

  final List<OrderItem> data;
  final int totalPrice;
  final double discount;

  CartState({

    this.data,
    this.totalPrice,
    this.discount
  });



  @override
  List<Object> get props => [data];

  @override
  bool get stringify => true;
}

class CartLoadedState extends CartState {
  CartLoadedState({

    List<OrderItem> data,
    int totalPrice,
    double discount,

  }) : super(
     data: data,totalPrice: totalPrice,discount: discount
  );
}
class CartLoaded2State extends CartState {
  CartLoaded2State({

    List<OrderItem> data,
    int totalPrice,
    double discount,

  }) : super(
      data: data,totalPrice: totalPrice,discount: discount
  );
}

class CartLoadingState extends CartState {
  CartLoadingState({

    List<OrderItem> data,
    int totalPrice,
    double discount,
  }) : super(
      data: data,totalPrice: totalPrice,discount: discount);

}

class Initial extends CartState {
  Initial({

    List<OrderItem> data,
    int totalPrice,
    double discount,
  }) : super(
      data : data,totalPrice: totalPrice,discount: discount);

}
