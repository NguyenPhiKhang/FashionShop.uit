import 'package:fashionshop/src/model/Filter.dart';

import 'package:fashionshop/src/model/Filter.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteLoadEvent extends FavoriteEvent {
  final String person_id;

  FavoriteLoadEvent({this.person_id});
  @override
  List<Object> get props => [person_id];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class FavoriteGetMoreDataEvent extends FavoriteEvent {





  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class actionFavoriteEvent extends FavoriteEvent {

  final String person_id;
  final String product_id;
  final int index;

  actionFavoriteEvent({this.person_id,this.product_id,this.index});



  @override
  List<Object> get props => [person_id,product_id,index];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
