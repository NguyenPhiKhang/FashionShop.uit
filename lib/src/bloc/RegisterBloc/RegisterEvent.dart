import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String username;
  final String password;
  final String idPermission;

  const RegisterButtonPressed({
    @required this.name,
    @required this.username,
    @required this.password,
    @required this.idPermission
  });

  @override
  List<Object> get props => [name,username, password,idPermission];

  @override
  String toString() =>
      'RegisterButtonPressed { username: $username, password: $password }';
}
