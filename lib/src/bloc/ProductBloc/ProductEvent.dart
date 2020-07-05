import 'package:fashionshop/src/model/Product.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {

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

