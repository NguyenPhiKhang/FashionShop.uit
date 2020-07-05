
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  ProductCard({this.product,this.index});
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width/2-30,
      height: MediaQuery.of(context).size.height/3+20,
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.colorBurn,
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),

      ),
      child: Column(
        children: <Widget>[
          Container(



              child: Image.network(product.imgUrl !=null? product.imgUrl:"https://cdn.tgdd.vn/comment/34134321/58595582_1405843519557852_4325264661025914880_n-20190424085228.jpg",fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width/2-30,
                height: MediaQuery.of(context).size.height/3-80,

                colorBlendMode: BlendMode.darken,
              )

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Container(
                  width: 170,
                  height: 120,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(product.name,
                            maxLines: 1
                            ,style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.w500

                            ),),
                        ),


                      ),
                      SizedBox(height: 20,
                        child: SmoothStarRating(
                          allowHalfRating: true,
                          starCount: 5,
                          size: 20,
                          rating: product.rating!=null? product.rating : 0 ,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          color: Colors.yellowAccent,
                          borderColor: Colors.grey,
                          spacing: 0.0,

                        ),),

                      SizedBox(height: 10,),
                      SizedBox(

                          height: 30,
                          child:Align(
                            alignment: Alignment.centerLeft,

                            child:
                            Text(NumberFormat.simpleCurrency(locale: "vi").format(product.price).toString(),style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.w500,),
                            ),

                          )
                      ),

                      SizedBox(
                          height: 30,
                          child:Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Align(
                                alignment: Alignment.centerLeft,

                                child:
                                Text(NumberFormat.simpleCurrency(locale: "vi").format(product.price).toString(),style: TextStyle(fontSize: 13,color: Colors.grey,decoration: TextDecoration.lineThrough),
                                ),

                              ),
                              product.promotion_percent!=0? Container(
                                height: 20,width: 40,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xffdb3022)),
                                child: Center(
                                  child: Text(product.promotion_percent.toString()+"%",style: TextStyle(fontSize: 15,color: Colors.white),),
                                ),
                              ): Container(),
                              //SizedBox(width: 5,),



                            ],
                          )
                      )


                    ],
                  ),
                ),

              ),

            ),
          ),


        ],
      ),
    );
  }
}
