import 'package:fashionshop/src/model/Product.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoadEvent extends ProductEvent {




  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class ProductGetMoreDataEvent extends ProductEvent {




  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class ProductByCategoryCodeEvent extends ProductEvent {

final int category_code;
const ProductByCategoryCodeEvent({@required this.category_code});


  @override
  List<Object> get props => [category_code];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
