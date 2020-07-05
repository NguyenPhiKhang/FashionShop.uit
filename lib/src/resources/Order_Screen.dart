
import 'package:fashionshop/src/CardView/OrderItemCard.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';


var list =[
//      new OrderItem(new Product("Name","https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg", "ádkajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdsadhsadjashdj", 100, "20",4.7), 2, "XL", "Black"),
//      new OrderItem(new Product("Name","https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg", "De123213213123s", 50, "20",2.3), 2, "XL", "Black"),
//      new OrderItem(new Product("Name","https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg", "Dádadsadaes", 99, "20",3.8), 2, "XL", "Black"),
//      new OrderItem(new Product("Name","https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg", "Deadssadasds", 08, "20",4.5) ,2, "XL", "Black"),
//      new OrderItem(new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "Deadsadsadasds", 12, "20",4.2), 2, "XL", "Black"),
//      new OrderItem(new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "Deadsadsadasds", 20, "20",4.2),2, "XL", "Black"),

];
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String Voucher = "Nhấn để chọn voucher";
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE7E7E7),
      body: Column(
        children: <Widget>[
          Container(

            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height-200,
            width: MediaQuery.of(context).size.width ,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: list.length,
                itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(color: Colors.white,),
                    margin: EdgeInsets.only(bottom: 15),
                    child: OrderItemCard(orderItem: list[index],),
                  );
                },

            ),
          ),

          GestureDetector(
            onTap: () {
             showModalBottomSheet(context: context,backgroundColor: Colors.white.withOpacity(0),
                 builder: (context) {
               return Container(
                 height: MediaQuery.of(context).size.height+250,
                 decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Color(0xffE7E7E7)),
                 child: Column(
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         GestureDetector(
                           onTap: () { Navigator.pop(context);},
                             child: Container(
                                margin: EdgeInsets.only(top: 10,right: 10),
                                 child: Icon(Icons.cancel,color: Colors.redAccent,size: 20,)
                             ),

                         )
                       ],
                     ),
                     SizedBox(height: 20,),
                     Container(
                       height: MediaQuery.of(context).size.height/2-50,
                       child:
                            ListView.builder(
                                 itemCount: 2,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context,index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 10,bottom: 10,right: 10),
                                    height: 80,
                                    color: Colors.white,
                                    child: Row(
                                      children: <Widget>[

                                        Container(
                                          child: Image.network("https://stc.shopiness.vn/deal/2020/02/26/e/f/8/0/1582709843928_540.png",
                                            width: MediaQuery.of(context).size.width/4,fit: BoxFit.fill,),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/4*2 -30,
                                          child: Center(
                                            child: Column(

                                              children: <Widget>[
                                                Text("Name Of Voucher",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 16),),
                                                SizedBox(height: 5,),
                                                Text("codeofvoucher",style:  TextStyle(fontSize: 12,color: Colors.black54),),
                                              ],
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context).size.width/4 +10,
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Text("6 days remaining",style:  TextStyle(fontSize: 14,color: Colors.black38), textAlign: TextAlign.center,),
                                                SizedBox(height: 5,),
                                                Container(
                                                  margin: EdgeInsets.only(right: 5,left: 5),
                                                  height: 40,

                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffDB3022)),
                                                  child: Center(
                                                    child: Text("Apply",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
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

                            )

                         
                     ),
                   ],
                 ),
               );
                 }
             );

            },
            child: Container(
              width: MediaQuery.of(context).size.width-20,
              height: 40,
              margin: EdgeInsets.only(top:10,left: 10,right: 10),
              padding: EdgeInsets.only(left:20,top: 10,bottom: 10,right: 0),
              color: Colors.white,

              child:Stack(
                children: <Widget>[
                         Text(Voucher,style: TextStyle(fontSize: 14,color: Colors.grey),),
                  if(Voucher!= "Nhấn để chọn voucher.")
                    Positioned(
                      right: 5,
                    child: Icon(Icons.cancel, color: Colors.redAccent,size: 20,),
                  ),
                ],
              )
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right:10),
            width: MediaQuery.of(context).size.width,
            height: 30,
            margin: EdgeInsets.only(top:10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Tổng Cộng: ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black38),),
                Text(NumberFormat.simpleCurrency(locale: "vi").format(1000000),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Color(0xffDB3022),borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width-20,
            margin: EdgeInsets.only(left: 10,top: 10,bottom: 5),
            child: Center(
              child: Text("Mua Hàng",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500 ),),
            ),
          )





        ],
      ),
    );
  }
}