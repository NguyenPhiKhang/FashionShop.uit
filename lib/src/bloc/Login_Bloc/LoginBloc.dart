import 'dart:async';

import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String id;

  String get getid => id;
  String name;

  String get getName => name;
  String avatar;

  String get getAvatar => avatar;
  String sex;

  String get getSex => sex;
  String numberPhone;

  String get getNumberphone => numberPhone;
  String email;

  String get getEmail => email;
  String birthday;

  String get getBirthday => birthday;
  List<String> shippingAddress;

  List<String> get getShippingAddress => shippingAddress;
  String password;

  String get getPassword => password;
  String token;

  String get getToken => token;
  GraphQLClient _client = graphQLConfiguration.clientToQuery();

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        QueryResult result = await _client
            .query(QueryOptions(documentNode: gql(Login), variables: {
          "email": event.username,
          "password": event.password,
        }));
        // if đúng thì yeild LoginOk else failure
        if (!result.hasException) {
          token = result.data['login']['token'];
          name = result.data['login']['account']['person']['name'];
          email = event.username;
          password = event.password;
          id = result.data['login']['account']['person']['_id'];
          avatar = result.data['login']['account']['person']['avatar'];
          numberPhone = result.data['login']['account']['person']['number_phone'];
          birthday = result.data['login']['account']['person']['birthday'];
          shippingAddress = (result.data['login']['account']['person']['shipping_address'] as List<dynamic>).cast<String>();

          sex = result.data['login']['account']['person']['sex'];

          yield LoginOk();
        } else {
          yield LoginInitial();

          yield LoginFailure(error: result.exception.toString());
        }
      } catch (error) {
        yield LoginInitial();
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
