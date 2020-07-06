
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ProductScreen.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override

  Widget build(BuildContext context) {

          return BlocProvider.value(
      value: BlocProvider.of<LoginBloc>(context),
        child: Container(
          child: Center(
            child: Text(BlocProvider.of<LoginBloc>(context).getToken,style: TextStyle(fontSize: 5),),
          ),
    ));
//    return Container(
//      child: Center(
//        child: Text(""),
//      ),
//    );
  }
}
