

import 'package:equatable/equatable.dart';
import 'package:fashionshop/src/model/ProductDetail.dart';


abstract class ProductDetailState extends Equatable {
  final ProductDetail data;


  ProductDetailState({
    this.data,

  });



  @override
  List<Object> get props => [data];

  @override
  bool get stringify => true;
}

class ProductDetailShowState extends ProductDetailState {
  ProductDetailShowState({
    ProductDetail data,

  }) : super(
      data: data);

}

class Initial extends ProductDetailState {
  Initial({
    ProductDetail data,

  }) : super(
      data: data);

}
