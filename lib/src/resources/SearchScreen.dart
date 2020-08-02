import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductState.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailBloc.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailEvent.dart';
import 'package:fashionshop/src/bloc/SearchBloc/SearchBloc.dart';
import 'package:fashionshop/src/bloc/SearchBloc/SearchEvent.dart';
import 'package:fashionshop/src/bloc/SearchBloc/SearchState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Product_Detail.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String SearchText;
  ScrollController _scrollController= ScrollController();
  bool searched= false;
  String value = "Giá: Không sắp xếp";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
        context.bloc<SearchBloc>().add(SearchGetMoreDataEvent(text: SearchText));
    });
  }
  @override

  Widget build(BuildContext context) {
    return  BlocBuilder<SearchBloc,SearchState>(
    builder:(context,state) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
    leading: GestureDetector(
    onTap: () {
    Navigator.pop(context);
    },
    child: Icon(
    Icons.arrow_back,
    color: Colors.white,
    size: 30,
    ),
    ),

    textTheme: TextTheme(),
    backgroundColor: Color(0xFF4ab3b5),
    title: Text(
    "Search by ProductName",
    style: TextStyle(color: Colors.white),
    textAlign: TextAlign.center,
    ),

    ),
    body: Stack(
      children:<Widget>[
        Column(
      children: <Widget>[
    Container(
    margin: EdgeInsets.only(right: 2,left:2,bottom: 5),
      padding:EdgeInsets.only(bottom:4 ),
      height: 35,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:Colors.grey.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child:Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 30,

              child: Center(
                child: GestureDetector(
                  child: FlatButton.icon(
                      onPressed: () {

                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return  Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Giá: Cao -> Thấp"),
                                    onTap: () {

                                      value ="Giá: Cao -> Thấp";
                                      context.bloc<SearchBloc>().add(SearchLoadEvent(text: SearchText,SortBy: -1));
                                      Navigator.pop(context);
                                      // context.bloc<ProductBloc>().add(ProductGetMoreDataEvent());


                                    },
                                  ),
                                  ListTile(
                                    title: Text("Giá: Thấp -> Cao"),
                                    onTap: () {

                                      value ="Giá: Thấp -> Cao";
                                      context.bloc<SearchBloc>().add(SearchLoadEvent(text: SearchText,SortBy: 1));
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text("Giá: Không sắp xếp"),
                                    onTap: () {

                                      value ="Giá: Không sắp xếp";
                                      context.bloc<SearchBloc>().add(SearchLoadEvent(text: SearchText,SortBy: 0));
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      icon: Icon(
                        Icons.import_export,
                        color: Colors.black,
                      ),
                      label: Text(value)),
                  onTap: () {},
                ),
              ),
            ),
          ],
        )),
      Row(
      children: <Widget>[
      Container(
      height: 40,
      width: MediaQuery.of(context).size.width-40,
      padding: EdgeInsets.all(8),
      child: TextField(
      decoration: InputDecoration(
      hintText: "Enter product name..."
      ),
      onChanged: (text){
      setState(() {
      SearchText=text;
      });
      },
      ),

      ),
      GestureDetector(
        child: Container(width: 30, margin: EdgeInsets.only(right: 10),
        child: Icon(Icons.search,size: 30,color: Colors.blueGrey,)),
        onTap: (){
          if(SearchText!=""){
            context.bloc<SearchBloc>().add(SearchLoadEvent(text: SearchText));

          }
        },
      )
      ],
      ),

      Stack(
      children: <Widget>[
       state.data.length==0?Container(
      child: Center(child: Text("Không có dữ liệu nào trùng khớp.",style: TextStyle(fontSize: 14,color: Colors.black),),),
      ):Container(
      //margin: EdgeInsets.only(left: 5),
      color: Colors.white,

      height: MediaQuery.of(context).size.height - 180,
      child: CustomScrollView(
      shrinkWrap: true,
      primary: false,
      controller:_scrollController ,


      scrollDirection: Axis.vertical,
      slivers: <Widget>[
      SliverGrid(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio:
      (MediaQuery.of(context).size.width / 2 -
      40) /
      (MediaQuery.of(context).size.height /
      3 +
      15),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      //childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
      ),
      delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
      return Container(
      margin:
      EdgeInsets.only(top: 10, ),
      padding: EdgeInsets.only(left: 10,bottom: 8,right:10),
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(0),
      borderRadius: BorderRadius.circular(8),
      ),

      //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: GestureDetector(
      child: Container(
      height: MediaQuery.of(context)
          .size
          .height /
      3 +
      20,
      decoration: BoxDecoration(
      color: Colors.white,
      backgroundBlendMode:
      BlendMode.colorBurn,
      borderRadius:
      BorderRadius.circular(8),
      border: Border.all(
      color: Colors.white),
      boxShadow: [
      BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(0, 0), // changes position of shadow
      ),
      ],
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.black.withOpacity(0.5),
//                                                 spreadRadius: 5,
//                                                 blurRadius: 7,
//                                                 offset: Offset(0, 3),
//
//
//                                               ),
//                                             ],
      ),
      child: ProductCard(
      product: state.data[index],
      index: index,
      ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BlocProvider<ProductDetailBloc>(
                        create: (context){
                          return ProductDetailBloc(

                          )..add(ProductDetailLoadEvent(id: state.data[index].id,person_id: context.bloc<LoginBloc>().id));
                        },
                        child: Product_Detail()
                    )
            ));
      }),
      );
      },
      childCount: state.data.length,
      ),
      ),
      ]),
      ),
      ],
      ),
      ],
      ),
      if  (state is SearchLoading)
        Positioned(
          bottom: 10,left: MediaQuery.of(context).size.width/2-15,
          child: Container(
            width: 30,
            height: 30,
            child:
             CircularProgressIndicator(backgroundColor: Colors.red,) ,
          ),
        )
      ]
    ),

    );
    });

  }
}
