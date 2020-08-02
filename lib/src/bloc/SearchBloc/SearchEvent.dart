
import 'package:fashionshop/src/model/Filter.dart';

import 'package:fashionshop/src/model/Filter.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchLoadEvent extends SearchEvent {
final int SortBy;

  final String text;

  SearchLoadEvent({this.text,this.SortBy});

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class SearchGetMoreDataEvent extends SearchEvent {
  final int SortBy;
final String text;

  SearchGetMoreDataEvent({@required this.text,this.SortBy});


  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
