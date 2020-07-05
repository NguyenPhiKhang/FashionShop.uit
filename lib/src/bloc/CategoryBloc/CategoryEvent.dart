import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {

}

class CategoryButtonPressed extends CategoryEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'LoginButtonPressed {  }';
}class InitiateEvent extends CategoryEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'LoginButtonPressed {  }';
}

