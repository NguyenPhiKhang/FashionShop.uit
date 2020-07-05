import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PaymentMethod.dart';



class PaymentMethod_Card extends StatelessWidget {
  @override
  final PaymentMethod paymentMethod;
  final int index;
   PaymentMethod_Card({this.paymentMethod,this.index});
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width -10,
          height: MediaQuery.of(context).size.height/3 -50,
          margin: EdgeInsets.only(left: 10,top: 10,right: 10),


decoration: BoxDecoration(
   borderRadius:  BorderRadius.circular(8),
  color: paymentMethod.BankName =="Vietcombank"? Color(0xff69AD42) :Color(0xff1F3D96),

   boxShadow: [
     BoxShadow(
       color: Color(0x10000000),
       blurRadius: 10,
       spreadRadius: 4,
       offset: Offset(0.0,8.0)
     )
   ]
),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16,
            top: 12,
            child: Image.network(paymentMethod.Logo_img,height: 25,width: 40, fit: BoxFit.fill,),
          ),
          Positioned(
            top: 16,
            right: 25,
              child: Center(child: Text(paymentMethod.BankName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),))
           ),
          Positioned(
            top: 50,
            left: 20,

            child: Text("Card Number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.left,),


          ),
          Positioned(
            top: 70,
            left: 20,

            child:Text(paymentMethod.CardNumber,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),


          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text("Owner",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.left,),
          ),
          Positioned(
            top: 125,
            left: 20,
            child: Text(paymentMethod.Name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),
          ),
          Positioned(
            top: 100,
            right: 20,
            child: Text("Expire Date",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.left,),
          ),
          Positioned(
            top: 125,
            right: 20,
            child: Text(paymentMethod.Expire_date,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),textAlign: TextAlign.left,),
          )

        ],
      ),
        );



  }
}
