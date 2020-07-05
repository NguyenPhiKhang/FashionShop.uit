import 'package:fashionshop/src/CardView/CategoryCardWithIcon.dart';
import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductState.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:fashionshop/src/resources/Filter_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Product_Detail.dart';
var productList  = [
//  new Product("Name","https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg", "ádkajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdsadhsadjashdj", 100, "20",4.7),
//  new Product("Name","https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg", "De123213213123s", 20, "20",2.3),
//  new Product("Name","https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg", "Dádadsadaes", 50, "20",3.8),
//  new Product("Name","https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg", "Deadssadasds", 99, "20",4.5),
//  new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "Deadsadsadasds", 66, "20",4.2),
];
void _onWidgetDidBuild(Function() callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
class ProductWithCatLv3_Screen extends StatefulWidget {
  final String title;
  final CategoryLevel2 categoryLevel2;
  ProductWithCatLv3_Screen({@required this.title,@required this.categoryLevel2});
  @override
  _ProductWithCatLv3_ScreenState createState() => _ProductWithCatLv3_ScreenState();
}

class _ProductWithCatLv3_ScreenState extends State<ProductWithCatLv3_Screen> {
  ScrollController _scrollController= ScrollController();
  ScrollController _scrollController2=ScrollController();
  bool flag =true;

  @override
  void initState()
  {
    super.initState();

      _scrollController2.addListener(() {
        if(_scrollController2.position.pixels==_scrollController2.position.maxScrollExtent)
          setState(() {
            flag =false;
          });



      });
      _scrollController.addListener(() {
        if(_scrollController.position.pixels==_scrollController.position.minScrollExtent)
        {

          setState(() {
            flag =true;

          });


        }

        if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent)
          context.bloc<ProductBloc>().add(ProductGetMoreDataEvent());

      });

  }

  Widget build(BuildContext context) {

    return  BlocBuilder<ProductBloc,ProductsState>(
        builder:(context,state) {
          return Scaffold(
            backgroundColor: Color(0xffE5E5E5),
            appBar: AppBar(
              title: Center(child: Text(widget.title)),

              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
        },
                child: Icon(Icons.arrow_back, color: Colors.blue, size: 30,),
              ),

              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white, size: 30,),

                ),

              ],
            ),
            body: SingleChildScrollView(

controller: _scrollController2,
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                     Container(
                       decoration: BoxDecoration(color: Colors.white),
                      height: MediaQuery.of(context).size.height/3+80,
                      width:MediaQuery.of(context).size.width ,
                      padding: EdgeInsets.only(top: 10,left: 10),
                      margin: EdgeInsets.only(top:10,left:0,bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text("TOP SẢN PHẨM BÁN CHẠY", style: TextStyle(fontSize: 10,color: Colors.black45),),
                                margin: EdgeInsets.only(top:0,left:0),
                                height: 20,
                              ),
                            ],

                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                  height: MediaQuery.of(context).size.height/3+40,
                                  width:MediaQuery.of(context).size.width -10,



                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productList.length ,
                                      itemBuilder:(context,index)
                                      {
                                        Product product= productList[index];
                                        return Padding(

                                          padding: EdgeInsets.only(right: 20),
                                          child:GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,border: Border.all(color: Colors.black38,)),
                                                child:
                                                ProductCard(product: product,index: index,),

                                              ),
                                              onTap: (){
                                                Navigator.push(context,MaterialPageRoute(
                                                    builder: (context)=> Product_Detail(product: product,index: index)
                                                )
                                                );
                                              }

                                          ),

                                        );

                                      }

                                  )

                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  Container(
                       decoration: BoxDecoration(color: Colors.white),
                      height: MediaQuery.of(context).size.height/3+80,
                      width:MediaQuery.of(context).size.width ,
                      padding: EdgeInsets.only(top: 10,left: 10),
                      margin: EdgeInsets.only(top:10,left:0,bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text("TOP SẢN PHẨM MỚI", style: TextStyle(fontSize: 10,color: Colors.black45),),
                                margin: EdgeInsets.only(top:0,left:0),
                                height: 20,
                              ),
                            ],

                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                  height: MediaQuery.of(context).size.height/3+40,
                                  width:MediaQuery.of(context).size.width -10,



                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productList.length ,
                                      itemBuilder:(context,index)
                                      {
                                        Product product= productList[index];
                                        return Padding(

                                          padding: EdgeInsets.only(right: 20),
                                          child:GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,border: Border.all(color: Colors.black38,)),
                                                child:
                                                ProductCard(product: product,index: index,),

                                              ),
                                              onTap: (){
                                                Navigator.push(context,MaterialPageRoute(
                                                    builder: (context)=> Product_Detail(product: product,index: index)
                                                )
                                                );
                                              }

                                          ),

                                        );

                                      }

                                  )

                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ///Danh Mục Catelv3 With Icon
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: MediaQuery.of(context).size.height/2+44,
                    width:MediaQuery.of(context).size.width ,
                    padding: EdgeInsets.only(top: 10,left: 10),
                    margin: EdgeInsets.only(top:10,left:0,bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text("Danh mục", style: TextStyle(fontSize: 10,color: Colors.black45),),

                              height: 20,
                            ),
                          ],

                        ),

                        Row(
                          children: <Widget>[
                            Container(
                                height: (MediaQuery.of(context).size.height/2+4),
                                width:MediaQuery.of(context).size.width -10,



                                child: GridView.builder(

                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: (MediaQuery.of(context).size.height/4)/(MediaQuery.of(context).size.width/5+20),
                                        crossAxisCount: 2
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.categoryLevel2.listSub_cat.length,

                                    itemBuilder:(context,index)
                                    {
                                      CategoryLevel3 category= widget.categoryLevel2.listSub_cat[index];
                                      return Padding(

                                        padding: EdgeInsets.only(right: 10),
                                        child:GestureDetector(
                                            child: Container(
                                              decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,),
                                              child: CategoryCardWithIcon(categoryLevel3:category),

                                            ),
                                            onTap: (){
//                                              Navigator.push(context,MaterialPageRoute(
//                                                  builder: (context)=> Product_Detail(product: product,index: index)
//                                              )
//                                              );
                                            }

                                        ),

                                      );

                                    }

                                )

                            ),
                          ],
                        ),
                      ],
                    ),

                  ),



                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 30,
                    color: Colors.yellowAccent.withOpacity(0.50),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: FlatButton.icon(onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                                builder: (context)=> Filter_Screen()
                            )
                            );
                          },
                              icon: Icon(
                                Icons.filter_list, color: Colors.black,),
                              label: Text("Filters")),
                        ),
                        Container(
                          child: GestureDetector(
                            child: FlatButton.icon(onPressed: () {
                              showModalBottomSheet(context: context,
                                  builder: (context) {
                                    return Column(
                                      children: <Widget>[
                                        ListTile(
                                          title: Text("Giá: Cao -> Thấp"),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          title: Text("Giá: Thấp -> Cao"),
                                          onTap: () {

                                          },
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                                icon: Icon(
                                  Icons.import_export, color: Colors.black,),
                                label: Text("Price: ")),
                            onTap: () {

                            },
                          ),
                        ),



                      ],
                    ),
                  ),







                  Container(
                    height: MediaQuery.of(context).size.height-130,
                     color: Color(0xffE5E5E5),
                    margin: EdgeInsets.only(top:0),
                    child: CustomScrollView (
                      shrinkWrap: true,
                      primary: false,
                        physics: flag==true? NeverScrollableScrollPhysics(): ClampingScrollPhysics(),
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        slivers: <Widget>[


                          SliverGrid(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                              crossAxisCount: 2,
                              childAspectRatio: (MediaQuery.of(context).size.width/2-40)/(MediaQuery.of(context).size.height/3+10),
                              //mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              //childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
                            ),
                            delegate: SliverChildBuilderDelegate(


                                  (BuildContext context, int index) {

                                return Container(
                                  margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                  color: Colors.black,
                                  //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  child:GestureDetector(
                                      child: Container(

                                        height: MediaQuery.of(context).size.height/3+10,
                                        decoration: BoxDecoration(color: Colors.black,backgroundBlendMode: BlendMode.colorBurn,borderRadius: BorderRadius.circular(0),border: Border.all(color: Colors.white)),
                                        child:
                                        ProductCard(product: state.data[index],index: index,),

                                      ),
                                      onTap: (){


                                      }

                                  ),
                                );
                              },
                              childCount: state.data.length,

                            ),

                          ),
                        ]
                    ),
                  ),

                ],
              ),

            ),
          );
        }
    );

  }
}
