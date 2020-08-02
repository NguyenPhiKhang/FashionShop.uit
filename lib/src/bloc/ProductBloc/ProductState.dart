import 'package:equatable/equatable.dart';
import 'package:fashionshop/src/model/Filter.dart';
import 'package:fashionshop/src/model/Product.dart';

abstract class ProductsState extends Equatable {
  final List<Product> data;
  final int sortBy;
  final Filter filterRules;
  final String error;

  ProductsState({
    this.data,
    this.filterRules,
    this.sortBy,
    this.error,
  });

  ProductsState copyWith({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  });

  ProductsState getLoading() {
    return copyWith(data: null);
  }

  bool get isProductsLoading => data == null;
  bool get isFilterRulesVisible => filterRules != null;
  bool get hasError => error != null;

  @override
  List<Object> get props => [data, filterRules, sortBy];

  @override
  bool get stringify => true;
}


class ProductsGridViewState extends ProductsState {
  ProductsGridViewState({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) : super(
      data: data, sortBy: sortBy, filterRules: filterRules, error: error);

  ProductsGridViewState getTiles() {
    return ProductsGridViewState(
        data: data, sortBy: sortBy, filterRules: filterRules);
  }

  @override
  ProductsGridViewState copyWith({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) {
    return ProductsGridViewState(
      data: data ?? this.data,
      filterRules: filterRules ?? this.filterRules,
      sortBy: sortBy ?? this.sortBy,
      error: error,
    );
  }
}
class ProductsAddmoreState extends ProductsState {
  ProductsAddmoreState({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) : super(
      data: data, sortBy: sortBy, filterRules: filterRules, error: error);

  ProductsAddmoreState getTiles() {
    return ProductsAddmoreState(
        data: data, sortBy: sortBy, filterRules: filterRules);
  }

  @override
  ProductsAddmoreState copyWith({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) {
    return ProductsAddmoreState(
      data: data ?? this.data,
      filterRules: filterRules ?? this.filterRules,
      sortBy: sortBy ?? this.sortBy,
      error: error,
    );
  }
}

class Loading extends ProductsState {
  Loading({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) : super(
      data: data, sortBy: sortBy, filterRules: filterRules, error: error);

  Loading getTiles() {
    return Loading(
        data: data, sortBy: sortBy, filterRules: filterRules);
  }

  @override
  Loading copyWith({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) {
    return Loading(
      data: data ?? this.data,
      filterRules: filterRules ?? this.filterRules,
      sortBy: sortBy ?? this.sortBy,
      error: error,
    );
  }
}



class Initial extends ProductsState {
  Initial({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) : super(
      data: data, sortBy: sortBy, filterRules: filterRules, error: error);

  Initial getTiles() {
    return Initial(
        data: data, sortBy: sortBy, filterRules: filterRules);
  }

  @override
  Initial copyWith({
    List<Product> data,
    int sortBy,
    Filter filterRules,
    String error,
  }) {
    return Initial(
      data: data ?? this.data,
      filterRules: filterRules ?? this.filterRules,
      sortBy: sortBy ?? this.sortBy,
      error: error,
    );
  }
}