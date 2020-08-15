
import 'package:equatable/equatable.dart';

abstract class MyOrderEvent extends Equatable {

}

class InitiateEvent extends MyOrderEvent {
  final String person_id;

  InitiateEvent({this.person_id});
  @override
  List<Object> get props => [person_id];

  @override
  String toString() =>
      'LoginButtonPressed {  }';
}

