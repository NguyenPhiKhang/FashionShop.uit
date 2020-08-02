import 'package:equatable/equatable.dart';

import 'package:fashionshop/src/model/Product.dart';
abstract class SearchState extends Equatable {
  final List<Product> data;
  final int SortBy;


  SearchState({
    this.data,
    this.SortBy
  });

  @override
  List<Object> get props => [data,SortBy];

  @override
  bool get stringify => true;
}

class SearchGridViewState extends SearchState {
  SearchGridViewState({
    List<Product> data,
    int SortBy
  }) : super(
      data: data,SortBy: SortBy);


}
class SearchAddmoreState extends SearchState {
  SearchAddmoreState({
    List<Product> data,
    int SortBy
  }) : super(
      data: data,SortBy:SortBy);

}

class SearchLoading extends SearchState {
  SearchLoading({
    List<Product> data,
    int SortBy


  }) : super(
      data: data,SortBy: SortBy);

}