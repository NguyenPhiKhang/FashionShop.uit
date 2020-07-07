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
String name;
String get getName => name;
String email;
String get getEmail =>email;
String token;
String get getToken => token;
  GraphQLClient _client = graphQLConfiguration.clientToQuery();

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if ( event is LoginButtonPressed)
      {
        yield LoginLoading();
        try {
          QueryResult result = await _client.query(QueryOptions(
            documentNode: gql(Login),
            variables: {
              "email": event.username,
              "password": event.password,
            }
        ));
          // if đúng thì yeild LoginOk else failure
              if(!result.hasException)
                { token = result.data['login']['token'];
                 name =result.data['login']['account']['person']['name'];
                 email=event.username;
yield LoginOk();
                }
              else {
                yield LoginInitial();

                yield LoginFailure(error: result.exception.toString());
              }
        }
        catch(error)
        {           yield LoginInitial();
                    yield LoginFailure(error: error.toString());
        }
      }

  }
  }
