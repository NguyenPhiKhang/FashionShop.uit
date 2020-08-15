import 'package:fashionshop/src/CardView/OrderItemCard.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:fashionshop/src/bloc/checkout_bloc/checkout_event.dart';
import 'package:fashionshop/src/bloc/checkout_bloc/checkout_state.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'HomeScreen.dart';
import 'PaymentMethod_Screen.dart';

class CheckOutScreen extends StatefulWidget {
  final List<OrderItem> listOrderItem;
  final int orderPrice;
  List<String> listId=[];

  CheckOutScreen({this.listOrderItem, this.orderPrice});

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  @override
  Widget build(BuildContext context) {
    for(int i =0;i<widget.listOrderItem.length;i++)
      {
        widget.listId.add(widget.listOrderItem[i].id);
      }
    return BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Đặt hàng")),
            backgroundColor: Colors.redAccent,
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
            actions: <Widget>[],
          ),
          body: Opacity(
            opacity: state is LoadingState ? 0.7 : 1,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white.withOpacity(0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 270,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffE7E7E7),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Shipping Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      margin: EdgeInsets.only(
                                          top: 10, left: 10, bottom: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Tên",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87),
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  "Change",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "0967624699",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Ktx khu B-ĐHQG",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Dĩ An, Đông Hòa, Bình Dương",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      margin: EdgeInsets.only(
                                          top: 10, left: 10, bottom: 10),
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 0, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Payment",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PaymentMethod_Screen()));
                                              },
                                              child: Text(
                                                "Change",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Image.network(
                                              "https://i.dlpng.com/static/png/494711_thumb.png",
                                              width: 60,
                                              height: 30,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            height: 30,
                                            child: Text("**** **** **** 1234",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
//                    Row(
//                      children: <Widget>[
//                        Container(
//                          width: MediaQuery.of(context).size.width-10,
//                          margin: EdgeInsets.only(left: 10,top:10),
//                          child: Text("Delivery method ",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
//                        )
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Container(
//                          margin: EdgeInsets.all(10),
//                          child: Row(
//                            children: <Widget>[
//                              Container(
//                                width: (MediaQuery.of(context).size.width-40)/3,
//                                margin: EdgeInsets.only(left:0),
//                                child: Image.network("https://suno.vn/blog/wp-content/uploads/2018/11/141139logos-800x285.jpg",height: (MediaQuery.of(context).size.width-40)/3,width:(MediaQuery.of(context).size.width-40)/3 ,fit: BoxFit.fill,),
//                              ),
//                              Container(
//                                width: (MediaQuery.of(context).size.width-40)/3,
//                                margin: EdgeInsets.only(left:10),
//                                child: Image.network("https://muatheme.vn/wp-content/uploads/2020/02/top-10-cong-ty-van-chuyen-giao-hang-tot-nhat-nam-2020-4643-6362.jpg",height: (MediaQuery.of(context).size.width-40)/3,width:(MediaQuery.of(context).size.width-40)/3 ,fit: BoxFit.fill,),
//                              ),
//                              Container(
//                                width: (MediaQuery.of(context).size.width-40)/3,
//                                margin: EdgeInsets.only(left:10,),
//                                child: Image.network("https://muatheme.vn/wp-content/uploads/2020/02/top-10-cong-ty-van-chuyen-giao-hang-tot-nhat-nam-2020-4643-3310.jpg",height: (MediaQuery.of(context).size.width-40)/3,width:(MediaQuery.of(context).size.width-40)/3 ,fit: BoxFit.fill,),
//                              ),
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3 +
                                          10,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: ListView.builder(
                                      itemCount: widget.listOrderItem.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: OrderItemCard(
                                            index: index,
                                            orderItem:
                                                widget.listOrderItem[index],
                                            isOrderDetail: true,
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.yellow.withOpacity(0.5)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Giá: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38),
                                      ),
                                      Text(
                                        NumberFormat.simpleCurrency(
                                                locale: "vi")
                                            .format(widget.orderPrice),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Vận Chuyển: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38),
                                      ),
                                      Text(
                                        NumberFormat.simpleCurrency(
                                                locale: "vi")
                                            .format(30000),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Tổng Cộng: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        NumberFormat.simpleCurrency(
                                                locale: "vi")
                                            .format(widget.orderPrice + 30000),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.bloc<CheckoutBloc>().add(
                                    OrderClickEvent(
                                        person_id:
                                            context.bloc<LoginBloc>().getid,
                                        totalPrice: widget.orderPrice + 30000,
                                        address: "Ktx Khu B- DHQG Tp.Hcm",
                                        carts: widget.listId,
                                        methodPayment: "Thanh toán khi nhận hàng",
                                        priceShip: 30000));
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: new Text("Thông báo!"),
                                      content: new Text(state.error==null?"Đặt hàng thành công!":state.error),
                                      actions: <Widget>[
                                        // usually buttons at the bottom of the dialog
                                        new FlatButton(
                                          child: new Text("Ok"),
                                          onPressed: () {
                                               if(state.error==null)
                                                 {
                                                   Navigator.push(
                                                     context,
                                                     MaterialPageRoute(builder: (context) => HomeScreen()),
                                                   );
                                                 }
                                               else
                                                 Navigator.pop(context);
                                            //context.bloc<CartBloc>().add(DeleteCartEvent(index: index,id: ["${context.bloc<CartBloc>().list_data[index].id}"]));

                                          },
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Color(0xffDB3022),
                                    borderRadius: BorderRadius.circular(20)),
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 5),
                                child: Center(
                                  child: Text(
                                    "Đặt Hàng",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is LoadingState)
                  Positioned(
                    bottom: 100,
                    right: MediaQuery.of(context).size.width / 2,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  )
              ],
            ),
          ));
    });
  }
}
