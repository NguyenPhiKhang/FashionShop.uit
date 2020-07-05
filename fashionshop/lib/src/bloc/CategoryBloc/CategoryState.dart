import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {


  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryState {}


class InitialState extends CategoryState {}


