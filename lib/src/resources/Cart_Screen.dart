import 'package:fashionshop/src/CardView/OrderItemCard.dart';
import 'package:fashionshop/src/bloc/CartBloc/CartBloc.dart';
import 'package:fashionshop/src/bloc/CartBloc/CartEvent.dart';
import 'package:fashionshop/src/bloc/CartBloc/CartState.dart';
import 'package:fashionshop/src/bloc/SearchBloc/SearchBloc.dart';
import 'package:fashionshop/src/bloc/checkout_bloc/checkout_bloc.dart';

import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/resources/CheckOut_Screen.dart';
import 'package:fashionshop/src/resources/SearchScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  final String person_id;

  const CartScreen({this.person_id});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String Voucher = "Nhấn để chọn voucher";
  bool chooseAll =true;
  List<OrderItem> list_chosen=[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                chooseAll =true;
           for(int i=0;i<state.data.length;i++)
             {
               if(state.data[i].isChosen==false)
                 {
                   chooseAll=false;
                   break;
                 }
             }

      if (state == Initial()) return Container();
      return Scaffold(
        appBar: AppBar(
          leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                  'assets/fashion_logo.png',
                  width: 30,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              )),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider<SearchBloc>(
                          create: (context) {
                            return SearchBloc();
                          },
                          child: SearchScreen()),
                    ));
              },
              child: Icon(Icons.search, color: Colors.white, size: 40),
            ),
          ],
          backgroundColor: Color(0xFF4ab3b5),
          title: Text(
            "Giỏ Hàng",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xffE5E5E5),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(height: 20,width: 30,alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(left:10,top: 5),
                    child: Checkbox(
                      value:chooseAll,
                      onChanged: (value){
                       chooseAll =value;
                      context.bloc<CartBloc>().add(CheckAllItemCartEvent(value: value));
                      },
                    )
                ),
                Container(height: 20,margin: EdgeInsets.only(left:0,top: 5),
                child: Center(
                  child: Text("Chọn tất cả",style: TextStyle(fontSize: 12,color: Colors.black),
                  ),
                )
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height - 320,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context.bloc<CartBloc>().list_data.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 30,width: 30,alignment: Alignment.topCenter,
                      child: Checkbox(
                        value:context.bloc<CartBloc>().list_data[index].isChosen ,
                        onChanged: (value){
                          chooseAll=false;
                          context.bloc<CartBloc>().add(CheckItemCartEvent(index: index,value:value));
                        },

                      )
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(bottom: 15),
                        child: Stack(
                          children: <Widget>[
                            OrderItemCard(
                              orderItem: context.bloc<CartBloc>().list_data[index],
                              index: index,
                            ),
                            Positioned( top: 5,right: 5 ,
                              child:GestureDetector(child: Icon(Icons.cancel, size: 20,color: Colors.black45,),
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

                                            context.bloc<CartBloc>().add(DeleteCartEvent(index: index,id: ["${context.bloc<CartBloc>().list_data[index].id}"]));
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
                      ),
                    ],
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white.withOpacity(0),
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 2 + 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            color: Color(0xffE7E7E7)),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent,
                                        size: 20,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 - 50,
                                child: ListView.builder(
                                  itemCount: 2,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 10, bottom: 10, right: 10),
                                      height: 80,
                                      color: Colors.white,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Image.network(
                                              "https://stc.shopiness.vn/deal/2020/02/26/e/f/8/0/1582709843928_540.png",
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4 *
                                                    2 -
                                                30,
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "Name Of Voucher",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "codeofvoucher",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4 +
                                                10,
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "6 days remaining",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black38),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5, left: 5),
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xffDB3022)),
                                                    child: Center(
                                                      child: Text(
                                                        "Apply",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 40,
                  margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                  padding:
                      EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 0),
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Text(
                        Voucher,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      if (Voucher != "Nhấn để chọn voucher")
                        Positioned(
                          right: 5,
                          child: Icon(
                            Icons.cancel,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ),
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 30,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tổng Cộng: ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(locale: "vi").format(state.totalPrice),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xffDB3022),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Center(
                  child: Text(
                    "Mua Hàng",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              onTap: () {
                list_chosen=[];
                for(int i =0 ; i<state.data.length;i++)
                  {  if(state.data[i].isChosen)
                    list_chosen.add(state.data[i]);
                  }
//                print(list_chosen);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlocProvider<CheckoutBloc>(
                      create: (context){
                        return CheckoutBloc(

                        );
                      },
                      child: CheckOutScreen(listOrderItem: list_chosen,orderPrice: state.totalPrice,)),
                  )
                );
              },
            )
          ],
        ),
      );
    });
  }
}
