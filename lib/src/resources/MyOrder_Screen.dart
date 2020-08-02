import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

List<String> list_status = [ "Chờ Xác Nhận","Đã Xác Nhận","Đang Giao","Đã Giao","Đã Hủy"
];



class MyOrder_Screen extends StatefulWidget {
  @override
  _MyOrder_ScreenState createState() => _MyOrder_ScreenState();
}

class _MyOrder_ScreenState extends State<MyOrder_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
        length: list_status.length,
    child:Scaffold(
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
          "Explore",
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.white60,
          isScrollable: true,
          tabs: list_status.map<Widget>((value) {
            return Tab(
              text: value,
            );
          }).toList(),
        ),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: TabBarView(
          children:
          list_status.map<Widget>(( value) {
            return MyOrder_TabPage(list_orders: list_status,);
          }).toList(),
        ),
      ),
    )
        )
    );
  }
}





class MyOrder_TabPage extends StatelessWidget {
  final List<String> list_orders;

  const MyOrder_TabPage({this.list_orders});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: List.generate(list_orders.length, (index)
          {
            return GestureDetector(
              onTap: (){},
              child: Container(
                margin: index!=0?EdgeInsets.only(left: 10,bottom: 10,right: 10):EdgeInsets.only(left: 10,bottom: 10,right: 10,top: 10),
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
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("Đơn hàng số: "+"00001",style: TextStyle(fontSize: 14,color: Color(0xff222222),fontWeight: FontWeight.w500),),
                          Text("05-12-2020",style: TextStyle(fontSize: 12,color:Color(0xff9B9B9B)),)
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Số Lượng: ",style: TextStyle(fontSize: 12,color:Color(0xff9B9B9B) ),),
                              Text("3",style: TextStyle(fontSize: 14,color: Color(0xff222222),fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Tổng tiền: ",style: TextStyle(fontSize: 12,color:Color(0xff9B9B9B) ),),
                              Text(NumberFormat.simpleCurrency(locale: "vi").format(1000000).toString(),style: TextStyle(fontSize: 14,color: Color(0xff222222),fontWeight: FontWeight.w400),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(height: 40,
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
                              border: Border.all(color: Colors.black,width: 1),
                                boxShadow: [
                            BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 0), // changes position of shadow
                          )
                      ],
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Chi tiết",style: TextStyle(fontSize: 14,color: Color(0xff222222)),),
                            ),
                          ),
                        ),
                        Center(
                          child: Text("Đang Giao",style: TextStyle(color: Color(0xff2AA952)),),
                        )

                      ],
                    ),
                    )

                  ],
                ),
              ),
            );
          }
          )
        )
    );
  }
}
