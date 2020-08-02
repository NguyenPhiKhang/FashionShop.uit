import 'package:equatable/equatable.dart';


abstract class CartEvent extends Equatable {
  const CartEvent();
}
class GetCartEvent extends CartEvent {

  final String person_id;

  GetCartEvent({ this.person_id});
  @override
  List<Object> get props => [person_id];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class UpdateCartEvent extends CartEvent {
  final String id;
  final int amount;

  final int index;

  UpdateCartEvent({ this.id,this.amount,this.index});
  @override
  List<Object> get props => [id,amount,index];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class DeleteCartEvent extends CartEvent {
  final List<String> id;
  final int index;
  DeleteCartEvent({ this.id,this.index});
  @override
  List<Object> get props => [id,index];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}

class CheckItemCartEvent extends CartEvent {
  final int index;
  final bool value;
  CheckItemCartEvent({this.index,this.value});
  @override
  List<Object> get props => [index,value];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
class CheckAllItemCartEvent extends CartEvent {
  final bool value;
  CheckAllItemCartEvent({this.value});
  @override
  List<Object> get props => [value];

  @override
  String toString() =>
      'ProductButtonPressed { ... }';
}
