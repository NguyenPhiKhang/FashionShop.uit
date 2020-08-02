import 'package:fashionshop/src/bloc/CartBloc/CartBloc.dart';
import 'package:fashionshop/src/bloc/CartBloc/CartEvent.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrderItemCard extends StatelessWidget {
  final OrderItem orderItem;
  final int index;
  const OrderItemCard({ this.orderItem,this.index});



  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network("https://fashionshopuit-server.azurewebsites.net/image/"+orderItem.productImgURL,fit: BoxFit.fill,),

            width: MediaQuery.of(context).size.width/3-15,
            height: MediaQuery.of(context).size.height/6+10,
          ),
          Container(
            width: MediaQuery.of(context).size.width*2/3-35,
            height: MediaQuery.of(context).size.height/6+10,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(


                  children: <Widget>[
                      Container(width:MediaQuery.of(context).size.width*2/3-60 ,child: Text(orderItem.productName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Text("Color: ", style: TextStyle(color: Colors.grey,fontSize: 12),),
                    Text(orderItem.Color,style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w500),),
                    SizedBox(width: 10,),
                    Text("Size: " , style: TextStyle(color: Colors.grey,fontSize: 12),),
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
                            heroTag: 'btn1${this.index}',

                            child: Icon(Icons.remove,color: Colors.black54,size: 16,),
                            backgroundColor: Colors.blueAccent.withOpacity(0.5),
                            onPressed: (){
                              context.bloc<CartBloc>().add(UpdateCartEvent(id: orderItem.id,amount: orderItem.count-1,index: index));
                            },

                          ),
                        ),
                        SizedBox(width: 10),
                        Text(orderItem.count.toString()),
                        SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                            heroTag: 'btn2${this.index}',
                            child: Icon(Icons.add,color: Colors.black54,size: 16,),
                            backgroundColor: Colors.blueAccent.withOpacity(0.5),
                            onPressed: (){
                              context.bloc<CartBloc>().add(UpdateCartEvent(id: orderItem.id,amount: orderItem.count+1,index: index));
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(NumberFormat.simpleCurrency(locale: "vi").format(orderItem.count*orderItem.productPrice).toString(),style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),textAlign: TextAlign.end,),
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
