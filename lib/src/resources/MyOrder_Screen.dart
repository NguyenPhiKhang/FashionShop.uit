import 'package:fashionshop/src/bloc/my_oder_bloc/my_order_bloc.dart';
import 'package:fashionshop/src/bloc/my_oder_bloc/my_order_state.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/order.dart';
import 'package:fashionshop/src/resources/OrderDetail_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

List<String> list_status = [
  "Chờ xử lí",
  "Đã xác nhận",
  "Đang giao",
  "Đã giao",
  "Hủy"
];

class MyOrder_Screen extends StatefulWidget {
  @override
  _MyOrder_ScreenState createState() => _MyOrder_ScreenState();
}

class _MyOrder_ScreenState extends State<MyOrder_Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(builder: (context, state) {
      if(state!= InitialState())
      return MaterialApp(
          home: DefaultTabController(
              length: list_status.length,
              child: Scaffold(
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
                    "Đơn hàng",
                    style: TextStyle(color: Colors.white),
                  ),
                  bottom: TabBar(
                    indicator: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                    unselectedLabelColor: Colors.white,
                    isScrollable: true,
                    tabs: list_status.map<Widget>((value) {
                      return Tab(
                        text: value,
                      );
                    }).toList(),
                  ),
                ),
                body: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TabBarView(
                    children: context.bloc<MyOrderBloc>().list_status_items.map<Widget>((value) {
                      return MyOrder_TabPage(
                        list_orders: value,
                      );
                    }).toList(),
                  ),
                ),
              )));
      return Center(child: CircularProgressIndicator());
    });
  }
}

class MyOrder_TabPage extends StatelessWidget {
  final List<Order> list_orders;

  const MyOrder_TabPage({this.list_orders});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: List.generate(list_orders.length, (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: index != 0
                  ? EdgeInsets.only(left: 10, bottom: 10, right: 10)
                  : EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
              padding: EdgeInsets.all(10),
//                height: MediaQuery.of(context).size.height/4-10,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Text(
                            "Mã đơn hàng: " + list_orders[index].id,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff222222),
                                fontWeight: FontWeight.w500),maxLines: null,
                          ),
                        ),
                        Text(
                          DateFormat("dd-MM-yyyy").format(DateTime.parse(list_orders[index].createDate)),
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff9B9B9B)),maxLines: null,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Số Lượng: ",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff9B9B9B)),
                            ),
                            Text(
                              list_orders[index].listOrderItem.length.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff222222),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Tổng tiền: ",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff9B9B9B)),
                            ),
                            Text(
                              NumberFormat.simpleCurrency(locale: "vi")
                                  .format(list_orders[index].totalPrice)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff222222),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetailScreen(orderDetail: list_orders[index],)

                          ));
                    },
                    child: Container(
                      height: 40,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "Chi tiết",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff222222)),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              list_orders[index].deliveryStatus,
                              style: TextStyle(color: Color(0xff2AA952)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        })));
  }
}
