
import 'dart:ffi';

import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';




class Product_Detail extends StatefulWidget {
  final Product product;
  final int index;
  Product_Detail({this.product,this.index});
  @override
  _Product_DetailState createState() => _Product_DetailState();
}

class _Product_DetailState extends State<Product_Detail> {
  List<AttributeValue> listSize =[];
  List<AttributeValue> listColor =[];
  bool isExpanded =false;

  String _currentSizeId =null;
  String _currentColorId = null;
  int soluongtonkho;
  List<String> listImage =[
    "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg",
        "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg",
        "https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg",
        "https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg",
        "https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i =0; i<widget.product.list_Attribute.length;i++)
      {
        if(widget.product.list_Attribute[i].name=="Màu sắc")
          {
            listColor= widget.product.list_Attribute[i].values;
          }
        if(widget.product.list_Attribute[i].name=="Kích thước")
          listSize = widget.product.list_Attribute[i].values;

      }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fashion App"),
        backgroundColor: Colors.redAccent,
        elevation: 0.1,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
        ),

        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.favorite_border,color: Colors.white,),

          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.shopping_cart,color: Colors.white,),

          ),
        ],

      ),
   body: Stack(
     children:<Widget>[ Container(
       width: MediaQuery.of(context).size.height,
       decoration: BoxDecoration(color:Color(0xffE5E5E5),),
         child: SingleChildScrollView(scrollDirection: Axis.vertical,

child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
             Container(
               width: MediaQuery.of(context).size.width,
               height: 300,
               child: Image.network(widget.product.imgUrl!=null?widget.product.imgUrl: "https://cdn.tgdd.vn/comment/34134321/58595582_1405843519557852_4325264661025914880_n-20190424085228.jpg",fit: BoxFit.fill,colorBlendMode: BlendMode.darken,),
             ),
               SizedBox(height: 10,),
                soluongtonkho!=null?Row(
                  children: <Widget>[
                    Container(
                      child: Text("Số lượng tồn kho: " +soluongtonkho.toString(), style: TextStyle(fontWeight: FontWeight.w300,color: Colors.redAccent,fontSize: 16),),
                    )
                  ],
                ):Row(),
                SizedBox(height: 10,),

                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      alignment: Alignment.center,
                      height: 30,
                      margin: EdgeInsets.fromLTRB(20, 0,20 , 0),
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(12),color: Color(0xffffffff) ),
                      child: DropdownButton<String>(
                          items: listSize.map((AttributeValue dropDownItem){
                                 return DropdownMenuItem<String>(
                                   value: dropDownItem.id,
                                   child: Center(child:Text(dropDownItem.name,style: TextStyle(fontWeight: FontWeight.bold),),),
                                 );
                          }).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              _currentSizeId=newValue;
                              if(_currentColorId!=null && _currentSizeId!= null)
                                for(int i=0;i<widget.product.list_optionAmount.length;i++)
                                {
                                  if(widget.product.list_optionAmount[i].option_color==_currentColorId && widget.product.list_optionAmount[i].option_size ==_currentSizeId)
                                    soluongtonkho= widget.product.list_optionAmount[i].amount;
                                }
                            });
                          },
                        value: _currentSizeId,
                        hint: Center(child: Text('Size',style: TextStyle(fontWeight: FontWeight.bold),)),

                        isExpanded: true,
                        isDense: true,
                      ),



                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/3,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(12),color: Color(0xffffffff) ),
                      margin: EdgeInsets.fromLTRB(20, 0,20 , 0),
                      child: DropdownButton(
                        items: listColor.map((AttributeValue dropDownItem){
                          return DropdownMenuItem(
                            value: dropDownItem.id,
                            child: Center(child:Text(dropDownItem.name,style: TextStyle(fontWeight: FontWeight.bold),)),
                          );
                        }).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            _currentColorId= newValue;
                            if(_currentColorId!=null && _currentSizeId!= null)
                              for(int i=0;i<widget.product.list_optionAmount.length;i++)
                              {
                                if(widget.product.list_optionAmount[i].option_color==_currentColorId && widget.product.list_optionAmount[i].option_size ==_currentSizeId)
                                  soluongtonkho= widget.product.list_optionAmount[i].amount;
                              }
                          });
                        },
                        value: _currentColorId,

                        isExpanded: true,

                        hint: Center(child: Text('Color',style: TextStyle(fontWeight: FontWeight.bold),)),
                        isDense: true,

                      ),



                    ),
                    Container(width: 30,height: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),

                    child: Icon(Icons.favorite_border),
                    ),
                  ],
                ),






        Container(

          decoration: BoxDecoration(color: Color(0xffffffff)),
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column( mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(width: MediaQuery.of(context).size.width-30,alignment: Alignment.center,height: 50,child: Center(child: Text(widget.product.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,))),

                ],
              ),
                SizedBox(height: 10,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Container(


                     child:SmoothStarRating(
                       allowHalfRating: true,
                       starCount: 5,
                       size: 30,
                       rating: widget.product.rating!=null?widget.product.rating :0,
                       filledIconData: Icons.star,
                       halfFilledIconData: Icons.star_half,
                       color: Colors.amber,
                       borderColor: Colors.grey,
                       spacing: 0.0,

                     ),

                   ),
                   Container(alignment: Alignment.topCenter, height: 30,child: Center(child: Text(NumberFormat.simpleCurrency(locale: "vi").format(widget.product.final_price).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),textAlign: TextAlign.center,))),
                 ],
               ),
               Row(

                 children: <Widget>[
                   SizedBox(width: 60,),
                   Container(height: 20,
                          alignment: Alignment.center,
                       child: Text("("+widget.product.rating.toString()+")"),


                   ),
                 ],
               ),
//              AnimatedCrossFade(firstChild: Text(widget.product.description,
//              maxLines: 2,style: TextStyle(fontSize: 20,color: Colors.black),),
//                secondChild: Text(widget.product.description,
//                  style: TextStyle(fontSize: 20,color: Colors.black),),
//                crossFadeState: isExpanded?CrossFadeState.showSecond : CrossFadeState.showFirst,
//                duration: kThemeAnimationDuration,
//                ),
//              GestureDetector(
//                child: Text(isExpanded? "Less" : "More...",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
//                onTap: (){
//                  setState(() {
//                    isExpanded ? isExpanded=false : isExpanded =true;
//                  });
//                },
//
//              ),
               ExpansionTile(

                 title: Container( alignment: Alignment.center,
                   width: MediaQuery.of(context).size.width,
                     child: Text("Description",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontWeight:  FontWeight.w500,fontSize: 16),),
                     color: Colors.black
                   ,
                 ),
                 children: <Widget>[
                     Html(
                       data: widget.product.description

                     ),
                 ],
               )

            ],
          ),
        ),

        Row(
          children: <Widget>[
            SizedBox(width: 10,),
            Text("Top Reviews:",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),)
          ],
        ),



        Stack(
          children: <Widget>[

            Container(
              decoration: BoxDecoration(color: Color(0xffffffff)),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),

              child: Column(
                children: <Widget>[

                  Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 20,),
                          Text("Nancy",style: TextStyle(fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: <Widget>[

                          Row(
                            children:<Widget>[
                              SmoothStarRating(
                                allowHalfRating: true,
                                starCount: 5,
                                size: 20,
                                rating: 4.3,
                                filledIconData: Icons.star,
                                halfFilledIconData: Icons.star_half,
                                color: Colors.amber,
                                borderColor: Colors.grey,
                                spacing: 0.0,

                              ),
                              Text("(4.3)",)
                        ]
                          ),

                          Container(margin: EdgeInsets.only(right: 10),
                            child: Text("11:20:02 , 20/08/2019",style: TextStyle(fontSize: 10,
                                color: Colors.black26,
                                ), ),
                          ),


                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Text(
                                "Nice product and your delivery is so good. I'm very satified.",
                                style: TextStyle(fontSize: 10,
                                    color: Colors.black,
                                    ),)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listImage.length,
                          itemBuilder: (context, index) {
                            String image = listImage[index];
                            return Padding(

                                padding: EdgeInsets.only(right: 20),
                                child: Image.network(image, fit: BoxFit.fill,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
                                  height: 150,

                                  colorBlendMode: BlendMode.darken,
                                )
                            );
                          }
                      )
                  )


                ],
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Align(
                  alignment: Alignment.topLeft,

                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg"),
                    radius: 15,
                  )
              ),
            ),
          ],
        )








  ],

),
         ),

       ),
       Positioned(bottom: 0,
         child:  Container(width:MediaQuery.of(context).size.width ,
           height: 35,
           padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
           color: Colors.white,

           child: ButtonTheme(
             minWidth: MediaQuery.of(context).size.width-20,
             height: 25,

             child: RaisedButton(

               color: Color(0xffDB3022),

               onPressed: (){},
               child: Text("ADD TO CART",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
             ),




           ),
         ),
       )
      ]
   ),



    );
  }
}
