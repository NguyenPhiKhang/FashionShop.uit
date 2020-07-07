import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OrderItemCard extends StatelessWidget {
  final OrderItem orderItem;

  const OrderItemCard({ this.orderItem});



  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network("https://fashionshopuit-server.azurewebsites.net/image/"+orderItem.productImgURL,fit: BoxFit.fill,),
            width: MediaQuery.of(context).size.width/3,
            height: MediaQuery.of(context).size.height/6+10,
          ),
          Container(
            width: MediaQuery.of(context).size.width*2/3-20,
            height: MediaQuery.of(context).size.height/6+10,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Text(orderItem.productName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                      Icon(Icons.more_vert, size: 20,color: Colors.black45,)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Text("Color: ", style: TextStyle(color: Colors.grey,fontSize: 16),),
                    Text(orderItem.Color,style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w500),),
                    SizedBox(width: 10,),
                    Text("Size: " , style: TextStyle(color: Colors.grey,fontSize: 16),),
                    Text(orderItem.Size,style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w500))
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height/6 -90 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(

                            child: Icon(Icons.remove,color: Colors.black54,size: 16,),
                            backgroundColor: Colors.blueAccent.withOpacity(0.5),

                          ),
                        ),
                        SizedBox(width: 10),
                        Text(orderItem.count.toString()),
                        SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                            child: Icon(Icons.add,color: Colors.black54,size: 16,),
                            backgroundColor: Colors.blueAccent.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Text("\u0024"+(orderItem.count*orderItem.productPrice).toString(),style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),textAlign: TextAlign.end,),
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
