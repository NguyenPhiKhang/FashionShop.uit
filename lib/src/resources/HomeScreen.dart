

import 'package:fashionshop/src/bloc/CartBloc/CartBloc.dart';
import 'package:fashionshop/src/bloc/CartBloc/CartEvent.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryBloc.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryEvent.dart';
import 'package:fashionshop/src/bloc/FavoriteBloc/FavoriteBloc.dart';
import 'package:fashionshop/src/bloc/FavoriteBloc/FavoriteEvent.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';

import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Category.dart';

import 'package:fashionshop/src/resources/ChatRoom.dart';
import 'package:fashionshop/src/resources/FavoriteScreen.dart';
import 'package:fashionshop/src/resources/HomePage.dart';
import 'package:fashionshop/src/resources/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'Cart_Screen.dart';
import 'ProductScreen.dart';



class HomeScreen extends StatefulWidget {
 final String Myname;

  const HomeScreen({ this.Myname});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 int currentIndex =0;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override

  Widget build(BuildContext context) {
    print(widget.Myname);
    final tabs= [
      BlocProvider<ProductBloc>(
          create: (context){
            return ProductBloc(

            )..add(ProductLoadEvent());
          },
          child:BlocProvider<CategoryBloc>(
              create: (context) {
                return CategoryBloc()
                  ..add(InitiateEvent());
              },
              child: HomePage())
          //HomePage()
      )
      ,
      BlocProvider<CartBloc>(
              create: (context) {
                return CartBloc()
                  ..add(GetCartEvent(person_id: context.bloc<LoginBloc>().getid));
              },
              child: CartScreen(person_id: context.bloc<LoginBloc>().getid))
        //HomePage()

        ,
      ChatRoom(MyName: widget.Myname),
      BlocProvider<FavoriteBloc>(
          create: (context) {
            return FavoriteBloc()
              ..add(FavoriteLoadEvent(person_id: context.bloc<LoginBloc>().getid));
          },
          child: FavoriteScreen()),
      ProfileScreen(),


    ];
          return BlocProvider.value(
      value: BlocProvider.of<LoginBloc>(context),
        child: Scaffold(
          body: tabs[currentIndex],
          bottomNavigationBar:  BottomNavigationBar(

            currentIndex: currentIndex ,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF4ab3b5),
            unselectedFontSize: 14,
            unselectedIconTheme: IconThemeData(size: 20,color: Colors.black54),
            backgroundColor: Colors.white,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text("Cart"),
                backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.send),
                title: Text("Chat"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Favorite"),
                backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("Profile"),
                backgroundColor: Colors.blue
              ),
            ],
            onTap: (index){
              setState(() {
                currentIndex=index;
              });
            },
          ),
        )
    );


  }
}
