import 'package:fashionshop/src/model/Filter.dart';

import 'package:fashionshop/src/model/Filter.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoadEvent extends ProductEvent {


final int SortBy;

  ProductLoadEvent({this.SortBy});

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class ProductGetMoreDataEvent extends ProductEvent {

  final int SortBy;

  ProductGetMoreDataEvent({this.SortBy});


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
class ProductGetMoreDataByCategoryCodeEvent extends ProductEvent {

  final int SortBy;
  final Filter filter;
  final int level_code;
  const ProductGetMoreDataByCategoryCodeEvent({this.SortBy,this.filter,this.level_code});
  @override
  List<Object> get props => [SortBy,Filter];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}


class FilterandSortByEvent extends ProductEvent {

  final int SortBy;
  final Filter filter;
  final int level_code;
  const FilterandSortByEvent({this.SortBy,this.filter,this.level_code});


  @override
  List<Object> get props => [SortBy,Filter];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}