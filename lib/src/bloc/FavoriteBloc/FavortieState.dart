
import 'package:equatable/equatable.dart';
import 'package:fashionshop/src/model/Product.dart';



abstract class FavoriteState extends Equatable {
  final List<Product> data;


  FavoriteState({
    this.data,

  });




  @override
  List<Object> get props => [data];

  @override
  bool get stringify => true;
}


class FavoriteLoadedState extends FavoriteState {
  FavoriteLoadedState({
    List<Product> data

  }) : super(
      data: data);

  }
  class FavoriteLoaded2State extends FavoriteState {
  FavoriteLoaded2State({
    List<Product> data

  }) : super(
      data: data);

  }
 class Loading extends FavoriteState {
  Loading({
    List<Product> data

  }) : super(
      data: data);

  }

class Initial extends FavoriteState {
  Initial({
    List<Product> data

  }) : super(
      data: data);

}

