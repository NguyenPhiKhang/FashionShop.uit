
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';

import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/resources/LoginScreen.dart';
import 'package:fashionshop/src/resources/add_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';



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
          home:LoginScreen()
//          BlocProvider<SearchBloc>(
//                  create: (context){
//            return SearchBloc(
//
//            );
//            },
//                child:SearchScreen()
//            )
                // LoginScreen()
//          BlocProvider<CategoryBloc>(
//                  create: (context){
//            return CategoryBloc(
//
//            )..add(InitiateEvent());
//            },
//                child:ExploreScreen()
//            )
//          BlocProvider<ProductBloc>(
//              create: (context){
//                return ProductBloc(
//
//                )..add(ProductGetMoreDataEvent());
//              },
//              child:Products_Screen(title: "product",)
//          )
                //ChatRoom(MyName: "Admin",)
          //LoginScreen()
          //ChatRoom(MyName: "Admin",)

          //CheckOutScreen()

//
                //HomePage()

          //LoginScreen()

// LoginScreen(),
        ),
            )));
  }
}
