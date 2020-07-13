import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Size {
  String Id;
  String name;
  bool c= false;

  Size(String id,String Name,)
  {
    Id = id;
    name =Name;

  }
}
 List<Size> listSize =[
   new Size("5ef5c29b6d9d08e65eeacb8c","S"),
   new Size("5ef5c29f6d9d08e65eeacb8d","XS"),
   new Size("5ef5c2a26d9d08e65eeacb8e","L"),
   new Size("5ef5c29b6d9d08e65eeacb8f","M"),
   new Size("5ef5c29b6d9d08e65eeacb90","XL"),



];
class color {
  String Id;
  String name;
  bool c= false;
  color(String id,String Name)
  {
    Id = id;
    name =Name;
  }
}

List<color> list_color =[
  new color("5ef5bfab6d9d08e65eeacb67", "Xanh lam"),
  new color("5ef5c01f6d9d08e65eeacb69", "Đỏ"),
  new color("5ef5c0266d9d08e65eeacb6a", "Cam"),
  new color("5ef5c0356d9d08e65eeacb6b", "Xanh lá"),
  new color("5ef5c0616d9d08e65eeacb6c", "Hồng"),

];



class Filter_Screen extends StatefulWidget {
  final int category_code;

  const Filter_Screen({this.category_code});
  @override
  _Filter_ScreenState createState() => _Filter_ScreenState();
}

class _Filter_ScreenState extends State<Filter_Screen> {
   RangeValues values =RangeValues(10000,3000000);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
              backgroundColor: Color(0xFF4ab3b5),
          elevation: 0.1,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
          ),



        ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15,top: 20,bottom:0),
                child: Text(
                  "Price Range",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: "Arial"),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Container(  height: 70,
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(top:10,bottom: 0),
                margin:EdgeInsets.only(top:10,bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children:<Widget>[
                    Center(
                    child: RangeSlider(
                      min: 1,
                      max: 3000000,
                      values: values,

                      divisions: 300,

                      activeColor: Color(0xffDB3022),
                      inactiveColor: Color(0xff9B9B9B),
                      onChanged: (value) {
                        setState(() {
                          values = value;

                        });
                      },

                    ),
                  ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            Text("\u0024"+values.start.round().toString()),
                            Text("\u0024"+values.end.round().toString()),
                          ],
                        ),
                      ),
                    )

    ]
                ),
              )
            ],
          ),


          //Colors Row
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15,top: 10,bottom:10),
                child: Text(
                  "Colors",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: "Arial"),
                ),
              )
            ],
          ),

        Container(
          height: 100,
          color: Colors.white,
          child: ListView.builder(
              itemBuilder: (context,index)
                  {
                    return CheckboxListTile(
                      title: Text(list_color[index].name),
                      value: list_color[index].c,
                      onChanged: (bool value){
                        setState(() {
                          list_color[index].c=value;
                        });
                      },
                    );
                  },
            itemCount: list_color.length,
          ),
        ),




          //Size Row

          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15,top: 10,bottom:10),
                child: Text(
                  "Size",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: "Arial"),
                ),
              )
            ],
          ),
          Container(
            height: 100,
            color: Colors.white,
            child: ListView.builder(
                itemBuilder: (context,index)
                {
                  return CheckboxListTile(
                    title: Text(listSize[index].name),
                    value: listSize[index].c,
                    onChanged: (bool value){
                      setState(() {
                        listSize[index].c=value;

                      });
                    },
                  );
                },
              itemCount:listSize.length ,

            ),
          ),


SizedBox(height: 50,),

          //Category Row
Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 100,
        child: Center(child: Text("Apply",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),)),
      ),
      onTap: (){
                List<String> colorId=[];
                List<String> sizeId=[];
                for(int i=0;i<listSize.length;i++) {
                  if (listSize[i].c == true)
                    sizeId.add(listSize[i].Id);
                }

                  for(int i=0;i<list_color.length;i++) {
                    if (list_color[i].c == true)
                      colorId.add(list_color[i].Id);
                  }
                  // widget.bloc.add()
               print(colorId);
               print(sizeId);
               Navigator.pop(context);
               Filter filter = Filter(widget.category_code, colorId, sizeId, values.start, values.end);
                 context.bloc<ProductBloc>().add(FilterandSortByEvent(filter: filter));
      },
    ),
    GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 100,
        child: Center(child: Text("Cancle",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),))
      ),
      onTap: (){
        Navigator.pop(context);
      },
    )
  ],
)

        ]
              ),
    );
  }
}
