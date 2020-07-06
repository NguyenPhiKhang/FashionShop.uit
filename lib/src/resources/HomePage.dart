import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryBloc.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductState.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:fashionshop/src/resources/ExploreScreen.dart';
import 'package:fashionshop/src/resources/Filter_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'Product_Detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _current = 0;
//  var productList  = [
//    new Product("Name","https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg", "ádkajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdsadhsadjashdj",100, "20",4.7),
//    new Product("Name","https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg", "De123213213123s", 100, "20",2.3),
//    new Product("Name","https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg", "Dádadsadaes", 99, "20",3.8),
//    new Product("Name","https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg", "Deadssadasds",50, "20",4.5),
//    new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "Deadsadsadasds", 79, "20",4.2),
//  ];
  var productList = [
//    new Product("Name","https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg", "<p> ádkajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdsadhsadjashdj </p>",100, "20",4.7),
//    new Product("Name","https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg", "<p>De123213213123s</p>", 100, "20",2.3),
//    new Product("Name","https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg", "<p>Dádadsadaes</p>", 99, "20",3.8),
//    new Product("Name","https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg", "<p>Dádadsadaes</p>",50, "20",4.5),
//    new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "<p>Dádadsadaes</p>", 79, "20",4.2),
  ];

  List imgList = [
    'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg',
    'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg',
    'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg',
    'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg'
  ];

  CarouselSlider carouselSlider;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  ScrollController _scrollController= ScrollController();
  ScrollController _scrollController2= ScrollController();
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
    return BlocBuilder<ProductBloc, ProductsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Fashion App"),
          backgroundColor: Colors.redAccent,
          elevation: 0.1,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Color(0xffE5E5E5),
              backgroundBlendMode: BlendMode.colorBurn),
          child: SingleChildScrollView(
            controller: _scrollController2,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                carouselSlider = CarouselSlider(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: true,
                  pauseAutoPlayOnTouch: Duration(seconds: 2),
                  scrollDirection: Axis.horizontal,
                  initialPage: 0,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgURL) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(color: Colors.green),
                          child: Image.network(imgURL, fit: BoxFit.fill),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(imgList, (index, url) {
                      return GestureDetector(
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.red
                                  : Colors.black12),
                        ),
                        onTap: () {},
                      );
                    })),

                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

                           children: <Widget>[

                     Text("Category",
                          style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          ),
                        ),

                             GestureDetector(
                                 child: Padding(
                                   padding: EdgeInsets.only(top: 5),
                                   child: Text("See more",

                                   style: TextStyle(color: Colors.blue,fontSize: 15),
                                     textAlign: TextAlign.center,
                                   ),
                                 ),

                               onTap: (){
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) =>
                                             BlocProvider<CategoryBloc>(
                                                 create: (context) {
                                                   return CategoryBloc()
                                                     ..add(InitiateEvent());
                                                 },
                                                 child: ExploreScreen())));
                               },
                             )
                           ],
                  ),
                ),
                /// ListView Category

                      /// GridView  of List categorylevel2
                      //                      Row(
//                        children: <Widget>[
//                          Container(
//                            child: Text("Danh mục", style: TextStyle(fontSize: 10,color: Colors.black45),),
//
//                            height: 20,
//                          ),
//                        ],
//
//                      ),
//
//                      Row(
//                        children: <Widget>[
//                          Container(
//                              height: (MediaQuery.of(context).size.height/2+4),
//                              width:MediaQuery.of(context).size.width -10,
//
//
//
//                              child: GridView.builder(
//
//                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                      childAspectRatio: (MediaQuery.of(context).size.height/4)/(MediaQuery.of(context).size.width/5+20),
//                                      crossAxisCount: 2
//                                  ),
//                                  scrollDirection: Axis.horizontal,
//                                  itemCount: context.bloc<CategoryBloc>().list_cat_1[0].listSub_cat.length,
//
//                                  itemBuilder:(context,index)
//                                  {
//                                    CategoryLevel2 category= context.bloc<CategoryBloc>().list_cat_1[0].listSub_cat[index];
//                                    return Padding(
//
//                                      padding: EdgeInsets.only(right: 10),
//                                      child:GestureDetector(
//                                          child: Container(
//                                            decoration: BoxDecoration(color: Colors.white,backgroundBlendMode: BlendMode.colorBurn,),
//                                            child: Container(
//                                              width: MediaQuery.of(context).size.width/5+20,
//                                              height: MediaQuery.of(context).size.height/4,
//                                              color: Colors.white,
//                                              child: Column(
//                                                children: <Widget>[
//                                                  Container(
//                                                    child: Image.network(category.imgUrl !=null?category.imgUrl : "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg" ,fit: BoxFit.fill,
//                                                      width: MediaQuery.of(context).size.width/5+20,
//                                                      height: MediaQuery.of(context).size.height/4-40,
//
//                                                      colorBlendMode: BlendMode.darken,
//                                                    ),
//
//                                                  ),
//
//                                                  Container(
//                                                    height: 40,
//
//                                                    child: Center(
//                                                      child: Text(category.name,style: TextStyle(fontSize: 13,color:Colors.black),maxLines: 2,textAlign: TextAlign.center,),
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//
//                                          ),
//                                          onTap: (){
////                                              Navigator.push(context,MaterialPageRoute(
////                                                  builder: (context)=> Product_Detail(product: product,index: index)
////                                              )
////                                              );
//                                          }
//
//                                      ),
//
//                                    );
//
//                                  }
//
//                              )
//
//                          ),
//                        ],
//                      ),

                SizedBox(
                  height: 20.0,
                ),

                Container(
                  height: 30,
                  color: Colors.yellowAccent.withOpacity(0.50),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          child: FlatButton.icon(onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                                builder: (context)=> Filter_Screen() //bloc: context.bloc<ProductBloc>()
                            )
                            );
                          },
                              icon: Icon(
                                Icons.filter_list, color: Colors.black,),
                              label: Text("Filters")),
                        ),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context)=> Filter_Screen() //bloc: context.bloc<ProductBloc>()
                          )
                          );
                        },
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
                                        onTap: () {

                                        },
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
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left:10),
                      height: MediaQuery.of(context).size.height-200,
                      child: CustomScrollView(
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
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0,
                                //childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
                              ),
                              delegate: SliverChildBuilderDelegate(


                                    (BuildContext context, int index) {

                                  return Container(
                                    margin: EdgeInsets.only(top: 10,right: 10),
                                    color: Colors.white.withOpacity(0),
                                    //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child:GestureDetector(
                                        child: Container(

                                          height: MediaQuery.of(context).size.height/3+20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            backgroundBlendMode: BlendMode.colorBurn,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.white),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.grey.withOpacity(0.5),
//                                                 spreadRadius: 5,
//                                                 blurRadius: 7,
//                                                 offset: Offset(0, 3),
//
//
//                                               ),
//                                             ],
                                          ),
                                          child:
                                          ProductCard(product: state.data[index],index: index,),

                                        ),
                                        onTap: (){
                                          Navigator.push(context,MaterialPageRoute(
                                              builder: (context)=> Product_Detail(product: state.data[index],index: index,)
                                          )
                                          );


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


              ],
            ),
          ),
        ),
      );
    });
  }
}
