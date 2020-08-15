import 'package:fashionshop/src/CardView/CategoryCardWithIcon.dart';
import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductState.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailBloc.dart';
import 'package:fashionshop/src/bloc/ProductDetailBloc/ProductDetailEvent.dart';
import 'package:fashionshop/src/bloc/SearchBloc/SearchBloc.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'package:fashionshop/src/model/Filter.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:fashionshop/src/resources/Filter_Screen.dart';
import 'package:fashionshop/src/resources/ProductScreen.dart';
import 'package:fashionshop/src/resources/SearchScreen.dart';
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
  String value ="Giá: Không sắp xếp";



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
          {
            if(context.bloc<ProductBloc>().state.filterRules!=null)
              {
                context.bloc<ProductBloc>().add(
                    ProductGetMoreDataByCategoryCodeEvent(
                        filter: context.bloc<ProductBloc>().state.filterRules));
              }
            else
              context.bloc<ProductBloc>().add(ProductByCategoryCodeEvent(
                  category_code: widget.categoryLevel2.level_code));
          }


      });

  }

  Widget build(BuildContext context) {

    return  BlocBuilder<ProductBloc,ProductsState>(
        builder:(context,state) {


          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(child: Text(widget.title)),
              backgroundColor: Color(0xFF4ab3b5),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
        },
                child: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
              ),

              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context)=>   BlocProvider<SearchBloc>(
                            create: (context){
                              return SearchBloc(

                              );
                            },
                            child:SearchScreen()
                        )
                    )

                    );
                  },
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

//                     Container(
//                       decoration: BoxDecoration(color: Colors.white),
//                      height: MediaQuery.of(context).size.height/3+80,
//                      width:MediaQuery.of(context).size.width ,
//                      padding: EdgeInsets.only(top: 10,left: 10),
//                      margin: EdgeInsets.only(top:10,left:0,bottom: 10),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Container(
//                                child: Text("TOP SẢN PHẨM BÁN CHẠY", style: TextStyle(fontSize: 10,color: Colors.black45),),
//                                margin: EdgeInsets.only(top:0,left:0),
//                                height: 20,
//                              ),
//                            ],
//
//                          ),
//
//                          Row(
//                            children: <Widget>[
//                              Container(
//                                  height: MediaQuery.of(context).size.height/3+40,
//                                  width:MediaQuery.of(context).size.width -10,
//
//
//
//                                  child: ListView.builder(
//                                      scrollDirection: Axis.horizontal,
//                                      itemCount: productList.length ,
//                                      itemBuilder:(context,index)
//                                      {
//                                        Product product= productList[index];
//                                        return Padding(
//
//                                          padding: EdgeInsets.only(right: 20),
//                                          child:GestureDetector(
//                                              child: Container(
//                                                decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,border: Border.all(color: Colors.black38,)),
//                                                child:
//                                                ProductCard(product: product,index: index,),
//
//                                              ),
//                                              onTap: (){
//                                                Navigator.push(context,MaterialPageRoute(
//                                                    builder: (context)=> Product_Detail(product: product,index: index)
//                                                )
//                                                );
//                                              }
//
//                                          ),
//
//                                        );
//
//                                      }
//
//                                  )
//
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//
//                    ),
//                  Container(
//                       decoration: BoxDecoration(color: Colors.white),
//                      height: MediaQuery.of(context).size.height/3+80,
//                      width:MediaQuery.of(context).size.width ,
//                      padding: EdgeInsets.only(top: 10,left: 10),
//                      margin: EdgeInsets.only(top:10,left:0,bottom: 10),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Container(
//                                child: Text("TOP SẢN PHẨM MỚI", style: TextStyle(fontSize: 10,color: Colors.black45),),
//                                margin: EdgeInsets.only(top:0,left:0),
//                                height: 20,
//                              ),
//                            ],
//
//                          ),
//
//                          Row(
//                            children: <Widget>[
//                              Container(
//                                  height: MediaQuery.of(context).size.height/3+40,
//                                  width:MediaQuery.of(context).size.width -10,
//
//
//
//                                  child: ListView.builder(
//                                      scrollDirection: Axis.horizontal,
//                                      itemCount: productList.length ,
//                                      itemBuilder:(context,index)
//                                      {
//                                        Product product= productList[index];
//                                        return Padding(
//
//                                          padding: EdgeInsets.only(right: 20),
//                                          child:GestureDetector(
//                                              child: Container(
//                                                decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,border: Border.all(color: Colors.black38,)),
//                                                child:
//                                                ProductCard(product: product,index: index,),
//
//                                              ),
//                                              onTap: (){
//                                                Navigator.push(context,MaterialPageRoute(
//                                                    builder: (context)=> Product_Detail(product: product,index: index)
//                                                )
//                                                );
//                                              }
//
//                                          ),
//
//                                        );
//
//                                      }
//
//                                  )
//
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//
//                    ),
                  ///Danh Mục Catelv3 With Icon
                  Center(
                    child: Container(
                         color: Colors.white,
                      height: 50,
                      width:MediaQuery.of(context).size.width ,
                      padding: EdgeInsets.only(top: 7,bottom: 7),
                      //margin: EdgeInsets.only(top:10,left:0,bottom: 10),
                      child: Column(
                        children: <Widget>[

                          Row(
                            children: <Widget>[
                              Center(
                                child: Container(
                                    height: 36,
                                    width:MediaQuery.of(context).size.width,

                                    child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                        itemBuilder:(context,index)
                                        {
                                          CategoryLevel3 category= widget.categoryLevel2.listSub_cat[index];
                                          return GestureDetector(
                                                child: Container(

                                                  height: 20,
                                                  width: 100,
                                                  margin: index!=0?EdgeInsets.only(left: 10,top: 3,bottom: 3):EdgeInsets.only(left: 0,top:3 , bottom: 3),
                                                  padding: EdgeInsets.only(left: 5,right: 5),
                                                  decoration: BoxDecoration(color:Color(0xff222222),
                                                    borderRadius: BorderRadius.circular(16),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                        offset: Offset(0, 0), // changes position of shadow
                                                      ),
                                                    ],

                                                  ),
                                                  child: Center(child: Text(category.name,style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700),textAlign: TextAlign.center,))

                                                ),
                                                onTap: (){
                                                  Navigator.push(context,MaterialPageRoute(
                                                      builder: (context)=> BlocProvider<ProductBloc>(
                                                          create: (context){
                                                            return ProductBloc(

                                                            )..add(ProductByCategoryCodeEvent(category_code: category.level_code));
                                                          },
                                                          child: Products_Screen(title: category.name,level_code: category.level_code,)
                                                      )
                                                  )
                                                  );
                                                }

                                            );



                                        },
                                      itemCount:widget.categoryLevel2.listSub_cat.length ,

                                    )

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),



                  Container(
                    margin: EdgeInsets.only(bottom: 5,top: 5),
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: FlatButton.icon(onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                                builder: (_)=> BlocProvider.value(
                                  value: context.bloc<ProductBloc>(),
                                  child: Filter_Screen(category_code: widget.categoryLevel2.level_code)
                                )

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
                              showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return  Column(
                                      children: <Widget>[
                                        ListTile(
                                          title: Text("Giá: Cao -> Thấp"),
                                          onTap: () {

                                            value ="Giá: Cao -> Thấp";
                                            context.bloc<ProductBloc>().add(FilterandSortByEvent(SortBy: -1,level_code: widget.categoryLevel2.level_code));
                                            Navigator.pop(context);
                                            // context.bloc<ProductBloc>().add(ProductGetMoreDataEvent());


                                          },
                                        ),
                                        ListTile(
                                          title: Text("Giá: Thấp -> Cao"),
                                          onTap: () {

                                              value ="Giá: Thấp -> Cao";
                                              context.bloc<ProductBloc>().add(FilterandSortByEvent(SortBy: 1,level_code: widget.categoryLevel2.level_code));
                                              Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: Text("Giá: Không sắp xếp"),
                                          onTap: () {

                                              value ="Giá: Không sắp xếp";
                                              context.bloc<ProductBloc>().add(FilterandSortByEvent(SortBy: 0,level_code: widget.categoryLevel2.level_code));
                                              Navigator.pop(context);

                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                                icon: Icon(
                                  Icons.import_export, color: Colors.black,),
                                label: Text(value)),
                            onTap: () {

                            },
                          ),
                        ),



                      ],
                    ),
                  ),







                  Stack(
                    children: <Widget>[
                      if  (state is Loading)
                        Positioned(
                          bottom: 10,left: MediaQuery.of(context).size.width/2-15,
                          child: Container(
                            width: 30,
                            height: 30,
                            child:
                            CircularProgressIndicator(backgroundColor: Colors.red,) ,
                          ),
                        ),
                      state.data.length!=0?Container(
                        height: MediaQuery.of(context).size.height-150,
                         color: Colors.white,

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
                                  childAspectRatio: (MediaQuery.of(context).size.width/2-40)/(MediaQuery.of(context).size.height/3+15),
                                  //mainAxisSpacing: 4.0,
                                  //childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
                                ),
                                delegate: SliverChildBuilderDelegate(


                                      (BuildContext context, int index) {

                                    return Container(
                                      margin:
                                      EdgeInsets.only(top: 10, ),
                                      padding: EdgeInsets.only(left: 10,bottom: 8,right:10),
                                      color: Colors.white.withOpacity(0),
                                      //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                      child:GestureDetector(
                                          child: Container(

                                            height: MediaQuery.of(context).size.height/3+10,
                                            decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.white),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 0), // changes position of shadow
                                                ),
                                              ],),
                                            child:
                                            ProductCard(product: state.data[index],index: index,),

                                          ),
                                          onTap: (){
                                            print(context.bloc<LoginBloc>().id);
                                    Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BlocProvider<ProductDetailBloc>(
                                                            create: (context){
                                                              return ProductDetailBloc(

                                                              )..add(ProductDetailLoadEvent(id: state.data[index].id,person_id: context.bloc<LoginBloc>().id));
                                                            },
                                                            child: Product_Detail()
                                                        )
                                                ));
                                          }

                                      ),
                                    );
                                  },
                                  childCount: state.data.length,

                                ),

                              ),
                            ]
                        ),
                      ):Container(
          child: Center(child: Text("Không có dữ liệu nào trùng khớp.",style: TextStyle(fontSize: 14,color: Colors.black),),),
          ),

                    ],
                  )

                ],
              ),

            ),
          );
        }
    );

  }
}
