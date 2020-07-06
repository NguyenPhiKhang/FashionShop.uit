



import 'package:fashionshop/src/model/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCardWithIcon extends StatelessWidget {
  final CategoryLevel3 categoryLevel3;

  const CategoryCardWithIcon({this.categoryLevel3,});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width/5+20,
        height: MediaQuery.of(context).size.height/4,
             color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(categoryLevel3.IconUrl !=null?categoryLevel3.IconUrl : "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg" ,fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width/5+20,
        height: MediaQuery.of(context).size.height/4-40,

        colorBlendMode: BlendMode.darken,
      ),

          ),

          Container(
            height: 40,

            child: Center(
              child: Text(categoryLevel3.name,style: TextStyle(fontSize: 13,color:Colors.black),maxLines: 2,textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}
