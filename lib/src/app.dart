import 'package:fashionshop/src/bloc/CategoryBloc/CategoryBloc.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryEvent.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryState.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/resources/ChatRoom.dart';
import 'package:fashionshop/src/resources/CheckOut_Screen.dart';

import 'package:fashionshop/src/resources/Conversation_Screen.dart';
import 'package:fashionshop/src/resources/ExploreScreen.dart';
import 'package:fashionshop/src/resources/HomePage.dart';
import 'package:fashionshop/src/resources/LoginScreen.dart';
import 'package:fashionshop/src/resources/Order_Screen.dart';
import 'package:fashionshop/src/resources/ProductScreen.dart';
import 'package:fashionshop/src/resources/ProductWithCatLv3_Screen.dart';
import 'package:fashionshop/src/resources/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'bloc/ProductBloc/ProductBloc.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: CacheProvider(
            child: BlocProvider(
              create: (BuildContext context) =>LoginBloc(),

              child: MaterialApp(
          title: 'Fashion Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: const MaterialColor(0xFF5BBABB, const <int, Color>{
                50: const Color(0xFF5BBABB),
                100: const Color(0xFF5BBABB),
                200: const Color(0xFF5BBABB),
                300: const Color(0xFF5BBABB),
                400: const Color(0xFF5BBABB),
                500: const Color(0xFF5BBABB),
                600: const Color(0xFF5BBABB),
                700: const Color(0xFF5BBABB),
                800: const Color(0xFF5BBABB),
                900: const Color(0xFF5BBABB),
              }),
          ),
          home: ChatRoom(MyName: "Admin",)
          //LoginScreen()
          //ChatRoom(MyName: "Admin",)

          //CheckOutScreen()

//          BlocProvider<ProductBloc>(
//              create: (context){
//                return ProductBloc(
//
//                )..add(ProductGetMoreDataEvent());
//              },
//              child:Products_Screen(title: "product",)
//          )
                //HomePage()

          //LoginScreen()
//          BlocProvider<CategoryBloc>(
//                  create: (context){
//            return CategoryBloc(
//
//            )..add(InitiateEvent());
//            },
//                child:ExploreScreen()     //HomePage();
//            )  //LoginScreen(),
        ),
            )));
  }
}
