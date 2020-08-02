




import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}
class ProductDetailLoadEvent extends ProductDetailEvent {
 final String id;
  final String person_id;

  ProductDetailLoadEvent({this.id, this.person_id});
  @override
  List<Object> get props => [id,person_id];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
class AddtocartEvent extends ProductDetailEvent {

 final String person_id;
 final String product_id;
 final String option_amount_id;
 final int amount;



 AddtocartEvent({ this.person_id,this.product_id,this.option_amount_id,this.amount});
 @override
 List<Object> get props => [person_id,product_id,option_amount_id,amount];

 @override
 String toString() =>
     'ProductButtonPressed { ... }';
}


class FavoriteTapEvent extends ProductDetailEvent {

 final String person_id;
 final String product_id;




 FavoriteTapEvent({ this.person_id,this.product_id});
 @override
 List<Object> get props => [person_id,product_id];

 @override
 String toString() =>
     'ProductButtonPressed { ... }';
}
