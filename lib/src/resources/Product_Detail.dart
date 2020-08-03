import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionshop/src/FirebaseMethod/FirebaseMethod.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailBloc.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailEvent.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailState.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:fashionshop/src/model/ProductDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:io' show Platform;

class Product_Detail extends StatefulWidget {
  @override
  _Product_DetailState createState() => _Product_DetailState();
}

class _Product_DetailState extends State<Product_Detail> {
  List<AttributeValue> listSize = [];
  List<AttributeValue> listColor = [];
  String option_amountId;
  int _current = 0;
  bool isExpanded = false;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String _currentSizeId = null;
  String _currentColorId = null;
  int soluongtonkho;
  List<String> listImage = [
    "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg",
    "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg",
    "https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg",
    "https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg",
    "https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (context.bloc<ProductDetailBloc>().productDetail != null) {
      print(listColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
      if (state == Initial()) return Container();
      for (int i = 0;
          i <
              context
                  .bloc<ProductDetailBloc>()
                  .productDetail
                  .list_Attribute
                  .length;
          i++) {
        if (context
                .bloc<ProductDetailBloc>()
                .productDetail
                .list_Attribute[i]
                .name ==
            "Màu sắc") {
          listColor = context
              .bloc<ProductDetailBloc>()
              .productDetail
              .list_Attribute[i]
              .values;
        }
        if (context
                .bloc<ProductDetailBloc>()
                .productDetail
                .list_Attribute[i]
                .name ==
            "Kích thước")
          listSize = context
              .bloc<ProductDetailBloc>()
              .productDetail
              .list_Attribute[i]
              .values;
      }
      return Scaffold(
        appBar: AppBar(
          title: Text("Fashion App"),
          backgroundColor: Color(0xFF4ab3b5),
          elevation: 0.1,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          actions: <Widget>[


          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - (Platform.isAndroid?120:150),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: CarouselSlider(
                        height: 300.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        reverse: false,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        enableInfiniteScroll: true,
                        pauseAutoPlayOnTouch: Duration(seconds: 2),
                        scrollDirection: Axis.horizontal,
                        initialPage: 0,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        items: context
                            .bloc<ProductDetailBloc>()
                            .productDetail
                            .images
                            .map((imgURL) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lightBlue.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                  ),
                                child: Image.network(
                                    "https://fashionshopuit-server.azurewebsites.net/image/" +
                                        imgURL,
                                    fit: BoxFit.fill),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(
                              context
                                  .bloc<ProductDetailBloc>()
                                  .productDetail
                                  .images, (index, url) {
                            return GestureDetector(
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 2.0, vertical: 10.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Colors.red
                                        : Colors.black12),
                              ),
                              onTap: () {},
                            );
                          })),
                    ),

//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 300,
//               child: Image.network(widget.product.imgUrl!=null?"https://fashionshopuit-server.azurewebsites.net/image/"+widget.product.imgUrl: "https://cdn.tgdd.vn/comment/34134321/58595582_1405843519557852_4325264661025914880_n-20190424085228.jpg",fit: BoxFit.fill,colorBlendMode: BlendMode.darken,),
//             ),

                    soluongtonkho != null
                        ? Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5),
                                width: MediaQuery.of(context).size.width - 20,
                                color: Colors.white,
                                child: Text(
                                  "Số lượng tồn kho: " +
                                      soluongtonkho.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.redAccent,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          )
                        : Row(),

                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 70) / 2 -
                                    30,
                            alignment: Alignment.center,
                            height: 30,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: DropdownButton<String>(
                              items:
                                  listSize.map((AttributeValue dropDownItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownItem.id,
                                  child: Center(
                                    child: Text(
                                      dropDownItem.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  _currentSizeId = newValue;
                                  if (_currentColorId != null &&
                                      _currentSizeId != null)
                                    for (int i = 0;
                                        i <
                                            context
                                                .bloc<ProductDetailBloc>()
                                                .productDetail
                                                .list_optionAmount
                                                .length;
                                        i++) {
                                      if (context
                                                  .bloc<ProductDetailBloc>()
                                                  .productDetail
                                                  .list_optionAmount[i]
                                                  .option_color ==
                                              _currentColorId &&
                                          context
                                                  .bloc<ProductDetailBloc>()
                                                  .productDetail
                                                  .list_optionAmount[i]
                                                  .option_size ==
                                              _currentSizeId)
                                        soluongtonkho = context
                                            .bloc<ProductDetailBloc>()
                                            .productDetail
                                            .list_optionAmount[i]
                                            .amount;
                                    }
                                });
                              },
                              value: _currentSizeId,
                              hint: Center(
                                  child: Text(
                                'Size',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )),
                              isExpanded: true,
                              isDense: true,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width:
                                (MediaQuery.of(context).size.width - 70) / 2 -
                                    30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 5),
                            child: DropdownButton(
                              items:
                                  listColor.map((AttributeValue dropDownItem) {
                                return DropdownMenuItem(
                                  value: dropDownItem.id,
                                  child: Center(
                                      child: Text(
                                    dropDownItem.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  _currentColorId = newValue;
                                  if (_currentColorId != null &&
                                      _currentSizeId != null)
                                    for (int i = 0;
                                        i <
                                            context
                                                .bloc<ProductDetailBloc>()
                                                .productDetail
                                                .list_optionAmount
                                                .length;
                                        i++) {
                                      if (context
                                                  .bloc<ProductDetailBloc>()
                                                  .productDetail
                                                  .list_optionAmount[i]
                                                  .option_color ==
                                              _currentColorId &&
                                          context
                                                  .bloc<ProductDetailBloc>()
                                                  .productDetail
                                                  .list_optionAmount[i]
                                                  .option_size ==
                                              _currentSizeId) {
                                        soluongtonkho = context
                                            .bloc<ProductDetailBloc>()
                                            .productDetail
                                            .list_optionAmount[i]
                                            .amount;
                                        option_amountId = context
                                            .bloc<ProductDetailBloc>()
                                            .productDetail
                                            .list_optionAmount[i]
                                            .id;
                                      }
                                    }
                                });
                              },
                              value: _currentColorId,
                              isExpanded: true,
                              hint: Center(
                                  child: Text(
                                'Color',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )),
                              isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 10,
                      color: Colors.white54,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xffffffff)),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: Text(
                                    context
                                        .bloc<ProductDetailBloc>()
                                        .productDetail
                                        .name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.left,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.topCenter,
                                  height: 30,
                                  child: Center(
                                      child: Text(
                                    NumberFormat.simpleCurrency(locale: "vi")
                                        .format(context
                                            .bloc<ProductDetailBloc>()
                                            .productDetail
                                            .final_price)
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ))),
                              SizedBox(
                                width: 15,
                              ),
                              context
                                          .bloc<ProductDetailBloc>()
                                          .productDetail
                                          .promotion_percent !=
                                      0
                                  ? Container(
                                      alignment: Alignment.topCenter,
                                      height: 20,
                                      child: Center(
                                          child: Text(
                                        NumberFormat.simpleCurrency(
                                                locale: "vi")
                                            .format(context
                                                .bloc<ProductDetailBloc>()
                                                .productDetail
                                                .price)
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )))
                                  : Container(),
                              SizedBox(
                                width: 5,
                              ),
                              context
                                          .bloc<ProductDetailBloc>()
                                          .productDetail
                                          .promotion_percent !=
                                      0
                                  ? Container(
                                      height: 20,
                                      child: Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 12,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xffdb3022)),
                                          child: Center(
                                            child: Text(
                                              context
                                                      .bloc<ProductDetailBloc>()
                                                      .productDetail
                                                      .promotion_percent
                                                      .toString() +
                                                  "%",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: SmoothStarRating(
                                  allowHalfRating: true,
                                  starCount: 5,
                                  size: 15,
                                  rating: context
                                              .bloc<ProductDetailBloc>()
                                              .productDetail
                                              .rating !=
                                          null
                                      ? context
                                          .bloc<ProductDetailBloc>()
                                          .productDetail
                                          .rating
                                      : 0,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  color: Colors.amber,
                                  borderColor: Colors.grey,
                                  spacing: 0.0,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 15,
                                alignment: Alignment.center,
                                child: Text(
                                  "(" +
                                      context
                                          .bloc<ProductDetailBloc>()
                                          .productDetail
                                          .rating
                                          .toString() +
                                      ")",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AnimatedCrossFade(
                            firstChild: Text(
                              context
                                  .bloc<ProductDetailBloc>()
                                  .productDetail
                                  .description,
                              maxLines: 2,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            secondChild: Text(
                              context
                                  .bloc<ProductDetailBloc>()
                                  .productDetail
                                  .description,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            crossFadeState: isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: kThemeAnimationDuration,
                          ),
                          GestureDetector(
                            child: Text(
                              isExpanded ? "Less" : "More...",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                isExpanded
                                    ? isExpanded = false
                                    : isExpanded = true;
                              });
                            },
//
                          ),
//               ExpansionTile(
//
//                 title: Container( alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width,
//                     child: Text("Description",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontWeight:  FontWeight.w500,fontSize: 16),),
//                     color: Colors.black
//                   ,
//                 ),
//                 children: <Widget>[
//                     Text(widget.product.description,style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.left,
//                     ),
//                 ],
//               )
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: Colors.white54,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Top Reviews:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),

                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color(0xffffffff)),
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Nancy",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          starCount: 5,
                                          size: 20,
                                          rating: 4.3,
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          color: Colors.amber,
                                          borderColor: Colors.grey,
                                          spacing: 0.0,
                                        ),
                                        Text(
                                          "(4.3)",
                                        )
                                      ]),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          "11:20:02 , 20/08/2019",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 15, 15, 15),
                                          child: Text(
                                            "Nice product and your delivery is so good. I'm very satified.",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                                  height: 150,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listImage.length,
                                      itemBuilder: (context, index) {
                                        String image = listImage[index];
                                        return Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Image.network(
                                              image,
                                              fit: BoxFit.fill,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              height: 150,
                                              colorBlendMode: BlendMode.darken,
                                            ));
                                      }))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg"),
                                radius: 15,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.white,
                        border: Border.all(color: Colors.black12, width: 2)),
                    child: Icon(Icons.favorite,color: state.data.isFavorite==false?Colors.grey: Colors.red,),
                  ),
                  onTap: (){
                        context.bloc<ProductDetailBloc>().add(FavoriteTapEvent(person_id: context.bloc<LoginBloc>().getid,product_id: state.data.id));
                  },
                ),
                GestureDetector(
                  child: Container(
                      width: MediaQuery.of(context).size.width - 65,
                      height: 35,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Metropolis"),
                      ))),
                  onTap: () {
                    if(_currentSizeId==null|| _currentColorId ==null)
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Lưu ý!"),
                            content: new Text(
                                "Hãy chọn size và màu sắc trước khi thêm vào giỏ."),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),

                            ],
                          );
                        },
                      );
                    }
                    else if (soluongtonkho < 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Lưu ý!"),
                            content: new Text(
                                "Sản Phẩm với size và color đã chọn hiện tại không còn trong kho"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),

                            ],
                          );
                        },
                      );
                    } else {


                                         context.bloc<ProductDetailBloc>().add(AddtocartEvent(person_id: context.bloc<LoginBloc>().getid,product_id:context.bloc<ProductDetailBloc>().productDetail.id ,option_amount_id: option_amountId,amount: 1));

                    }
                  },
                ),
              ],
            ),
          ]),
        ),
      );
    });
  }
}
