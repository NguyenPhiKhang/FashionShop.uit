import 'package:flutter/material.dart';

class Filter_Screen extends StatefulWidget {
  @override
  _Filter_ScreenState createState() => _Filter_ScreenState();
}

class _Filter_ScreenState extends State<Filter_Screen> {
   RangeValues values =RangeValues(20,100);
List<Color> listColor=[Color(0xff020202),Color(0xffF6F6F6),Color(0xffB82222),Color(0xffBEA9A9),Color(0xffE2BB8D),Color(0xff151867),Color(0xff151867),Color(0xff151867),Color(0xff151867),Color(0xff151867)];
   List<bool>   listClicked = [false,false,false,false,false,false,false,false,false,false];
   List<String> listSize=["XS","S","M","L","XL"];
   List<bool>   listClickedSize = [false,false,false,false,false];
   List<String> listCategories=["Women","Men","Boys","Girls","Kid"];
   List<bool>   listClickedCategories = [false,false,false,false,false];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),

          elevation: 0.1,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
          ),



        ),
      backgroundColor: Color(0xffE5E5E5),

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
                      min: 0,
                      max: 200,
                      values: values,

                      divisions: 100,

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

          Container(height: 80,

color: Colors.white,

                  child: ListView.builder(

                     scrollDirection: Axis.horizontal,
                      itemCount: listColor.length ,
                      itemBuilder:(context,index)
                      {

                        return Padding(

                          padding: EdgeInsets.only(left:10,right: 10),
                          child:GestureDetector(
                              child: Container(

                                height: 50,width: 50,

                                decoration: BoxDecoration(shape: BoxShape.circle,border: listClicked[index]==true? Border.all(width: 1,color: Colors.red) :null ),

                                child:
                                Container(height: 30,width: 30,

                      decoration: BoxDecoration(color: listColor[index],shape: BoxShape.circle),
                      margin: EdgeInsets.all(2),
                      )

                              ),
                              onTap: (){
setState(() {
  listClicked[index] =!listClicked[index];
});
                                         }
                                )
                                );
                              }

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
            height: 60,
            color: Colors.white,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: listSize.length ,
                itemBuilder:(context,index)
                {

                  return Padding(

                      padding: EdgeInsets.only(left:10,right: 10,top:10,bottom: 10),
                      child:GestureDetector(
                          child: Container(

                              height: 40,width: 40,

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: listClickedSize[index]==true?  Colors.red:Colors.white,border: Border.all(
                                width: 1,color: Colors.black45
                              ) ),

                              child:
                              Center(
                                child:Text(listSize[index] ,style: TextStyle(color: listClickedSize[index]==true?  Colors.white:Colors.black,fontSize: 13,))

                              )

                          ),
                          onTap: (){
                            setState(() {
                              listClickedSize[index] =!listClickedSize[index];
                            });
                          }
                      )
                  );
                }

            ),
          ),

          //Category Row

          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15,top: 10,bottom:10),
                child: Text(
                  "Category",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,fontFamily: "Arial"),
                ),
              )
            ],
          ),

          Container(
            height: 60,
            color: Colors.white,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: listCategories.length -2,

                itemBuilder:(context,index)
                {

                  return Padding(

                      padding: EdgeInsets.only(left:15,right: 10,top:10,bottom: 10),
                      child:GestureDetector(
                          child: Container(

                              height: 40,width: MediaQuery.of(context).size.width/4,

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: listClickedCategories[index]==true?  Colors.red:Colors.white,border: Border.all(
                                  width: 1,color: Colors.black45
                              ) ),

                              child:
                              Center(
                                  child:Text(listCategories[index] ,style: TextStyle(color: listClickedCategories[index]==true?  Colors.white:Colors.black,fontSize: 13,))

                              )

                          ),
                          onTap: (){
                            setState(() {
                              listClickedCategories[index] =
                              !listClickedCategories[index];

                            }

                              );
                          }
                      )
                  );
                }

            ),
          ),
          Container(
            height: 60,
            color: Colors.white,
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: listCategories.length -3,

                itemBuilder:(context,index)
                {

                  return Padding(

                      padding: EdgeInsets.only(left:15,right: 10,top:10,bottom: 10),
                      child:GestureDetector(
                          child: Container(

                              height: 40,width: MediaQuery.of(context).size.width/4,

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: listClickedCategories[index+3]==true?  Colors.red:Colors.white,border: Border.all(
                                  width: 1,color: Colors.black45
                              ) ),

                              child:
                              Center(
                                  child:Text(listCategories[index+3] ,style: TextStyle(color: listClickedCategories[index+3]==true?  Colors.white:Colors.black,fontSize: 13,))

                              )

                          ),
                          onTap: (){
                            setState(() {


                                listClickedCategories[index + 3] =
                                !listClickedCategories[index + 3];


                            }

                            );
                          }
                      )
                  );
                }

            ),
          ),
        ]
              ),









    );
  }
}
