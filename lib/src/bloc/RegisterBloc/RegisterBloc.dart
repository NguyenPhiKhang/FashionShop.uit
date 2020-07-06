import 'dart:async';

import 'package:fashionshop/src/FirebaseMethod/FirebaseMethod.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'RegisterEvent.dart';
import 'RegisterState.dart';



GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {



  GraphQLClient _client = graphQLConfiguration.clientToQuery();

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
      RegisterEvent event,
      ) async* {
    if ( event is RegisterButtonPressed)
    {
      yield RegisterLoading();
      try {
        QueryResult result = await _client.mutate(MutationOptions(
            documentNode: gql(Register),
            variables: {
              "name" :event.name,
              "email": event.username,
              "password": event.password,
              "permission_id": event.idPermission,
            }
        ));
        // if đúng thì yeild LoginOk else failure
        if(!result.hasException)
        {
          Map<String,String> userMap = {
            "name": event.name,
            "email": event.username,
          };
          FireBaseMethod().uploadUserInfo(userMap);
            String chatRoomId =  getChatRoomId("Admin", event.name);
          List<String> users = [ "Admin",event.name];
          Map<String,dynamic> chatRoomMap ={
            "users" :users,
            "chatroomId": chatRoomId
          };

          FireBaseMethod().CreateChatRoom(chatRoomId, chatRoomMap);


        yield RegisterOk();

        }
        else {
          yield RegisterInitial();
          yield RegisterFailure(error: result.exception.toString());
        }
      }
      catch(error)
      {           yield RegisterInitial();
      yield RegisterFailure(error: error.toString());
      }
    }

  }
}


getChatRoomId(String a, String b) {
    if(a.substring(0,1).codeUnitAt(0)>b.substring(0,1).codeUnitAt(0))
      {
        return "$b\_$a";
      }
    else return "$a\_$b";
}