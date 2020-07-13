
import 'package:fashionshop/src/CardView/PaymentMethod.dart';
import 'package:fashionshop/src/CardView/PaymentMethod_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<PaymentMethod> listItem =[
  PaymentMethod("Nguyễn Quang Khang", "**** **** **** 1234", "05/20", "Vietcombank", "https://i.dlpng.com/static/png/494711_thumb.png"),

  PaymentMethod("Nguyễn Quang Khang", "**** **** **** 1234", "05/20", "BIDV", "https://pluspng.com/img-png/bidv-png-bidv-logo-png-pluspng-com-630-bidv-logo-png-630.jpg"),
  PaymentMethod("Nguyễn Quang Khang", "**** **** **** 1234", "05/20", "Vietcombank", "https://i.dlpng.com/static/png/494711_thumb.png"),

  PaymentMethod("Nguyễn Quang Khang", "**** **** **** 1234", "05/20", "BIDV", "https://pluspng.com/img-png/bidv-png-bidv-logo-png-pluspng-com-630-bidv-logo-png-630.jpg"),
];

class PaymentMethod_Screen extends StatefulWidget {
  @override
  _PaymentMethod_ScreenState createState() => _PaymentMethod_ScreenState();
}

class _PaymentMethod_ScreenState extends State<PaymentMethod_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffffffff),
    appBar: AppBar(
    leading: GestureDetector(
    onTap: () {
    Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back,color: Colors.blue,size: 30,),
    ),

    actions: <Widget>[
    IconButton(
    onPressed: (){},
    icon: Icon(Icons.add_circle,color: Colors.white,size: 40,),

    ),

    ],
    textTheme:TextTheme(),
    backgroundColor: Color(0xFF4ab3b5),
    title: Text("Explore",style: TextStyle(color: Colors.white)),
    ),
        body: Container(

          color: Color(0xffffffff),
 child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listItem.length ,
        itemBuilder:(context,index)
        {
          PaymentMethod paymentMethod = listItem[index];
          return Padding(

            padding: EdgeInsets.only(bottom: 10),
            child:Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,),
                    child:
                    PaymentMethod_Card(paymentMethod: paymentMethod,index: index,),

                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    child: Container(height: 30,width: 150,
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),),
                    child: Center(
                      child: Text("Choose this Payment",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 14)),
                    ),
                    ),
                    onTap: () {},
                  )
                ]
            ),

          );

        }

         ),
      )
    );
  }
}
