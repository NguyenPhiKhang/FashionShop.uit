import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/FavoriteBloc/FavoriteBloc.dart';
import 'package:fashionshop/src/bloc/FavoriteBloc/FavoriteEvent.dart';
import 'package:fashionshop/src/bloc/FavoriteBloc/FavortieState.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailBloc.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Product_Detail.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          textTheme: TextTheme(),
          backgroundColor: Color(0xFF4ab3b5),
          title: Text(
            "Yêu Thích",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          //margin: EdgeInsets.only(left: 5),
          color: Colors.white,

          height: MediaQuery.of(context).size.height,
          child: CustomScrollView(
              shrinkWrap: true,
              primary: false,
              controller: _scrollController,
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
                        child: Stack(
                          children: <Widget>[
                            GestureDetector(
                                child: Container(
                                  height: MediaQuery.of(context)
                                      .size
                                      .height /
                                      3 +
                                      70,
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
                                  child:
                                      ProductCard(
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
                                                              Positioned( top: 2,right: 2 ,
                                      child:GestureDetector
                                        (child: Icon(Icons.cancel, size: 20,color: Colors.black45,),
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (_) {
                                              // return object of type Dialog
                                              return AlertDialog(
                                                title: new Text("Lưu ý!"),
                                                content: new Text("Bạn có chắc muốn xóa sản phẩm này không?"),
                                                actions: <Widget>[
                                                  // usually buttons at the bottom of the dialog
                                                  new FlatButton(
                                                    child: new Text("Có"),
                                                    onPressed: () {

                                                     context.bloc<FavoriteBloc>().add(actionFavoriteEvent(person_id: context.bloc<LoginBloc>().getid,product_id:state.data[index].id,index: index ));
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  new FlatButton(
                                                    child: new Text("Hủy"),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      )
                                  )
                          ],

                        ),
                      );
                    },
                    childCount: state.data.length,
                  ),
                ),
              ]),
        ),
      );
    });
  }
}
