import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class MyOrderState extends Equatable {


  @override
  List<Object> get props => [];
}

class LoadMyOrder extends MyOrderState {}


class InitialState extends MyOrderState {}


