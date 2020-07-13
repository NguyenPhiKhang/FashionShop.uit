import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryBloc.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryEvent.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryState.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductState.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:fashionshop/src/resources/ExploreScreen.dart';
import 'package:fashionshop/src/resources/Filter_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'ProductWithCatLv3_Screen.dart';
import 'Product_Detail.dart';

//GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
//List<CategoryLevel1> list_cat_1 =[];
//void LoadCategory ()async{
//
//  GraphQLClient _client = graphQLConfiguration.clientToQuery();
//  QueryResult result = await _client.query(
//      QueryOptions(
//        documentNode: gql(GetAllCategories),
//      )
//  );
//  List<LazyCacheMap> listdata_level1 =
//  (result.data["getAllCategory"] as List<dynamic>).cast<LazyCacheMap>();
////           print(listdata_level1[0].length);
////        List<LazyCacheMap> listdata_level2 =
////          (listdata_level1[0]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
////        print(listdata_level2.length);
////        List<LazyCacheMap> listdata_level3 =
////                (listdata_level2[0]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
////            print(listdata_level3.length);
////        List<CategoryLevel3> list_cat_3 =[];
////        list_cat_3.add(new CategoryLevel3("a", listdata_level3[0]["icon"]));
//
//
//
//  for(int i =0;i < listdata_level1.length;i++)
//  {
//    List<LazyCacheMap> listdata_level2 =
//    (listdata_level1[i]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
//    List<CategoryLevel2> list_cat_2=[];
//    for(int j=0;j< listdata_level2.length;j++)
//    {
//      List<LazyCacheMap> listdata_level3 =
//      (listdata_level2[j]["subCat"] as List<dynamic>).cast<LazyCacheMap>();
//      List<CategoryLevel3> list_cat_3 =[];
//      for(int k=0;k<listdata_level3.length;k++)
//      {
//        list_cat_3.add(new CategoryLevel3(listdata_level3[k]["icon"], listdata_level3[k]["name"],listdata_level3[k]["category_code"]));
//      }
//      list_cat_2.add(new CategoryLevel2(listdata_level2[j]["icon"], listdata_level2[j]["name"],listdata_level2[j]["category_code"] ,list_cat_3));
//
//    }
//
//    list_cat_1.add(new CategoryLevel1(listdata_level1[i]["name"], list_cat_2));
//  }
//}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _current = 0;
  String value="Giá: Không sắp xếp";

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

  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  bool flag = true;

  @override
  void initState() {
    super.initState();
    //LoadCategory();
       print("Reload");
    _scrollController2.addListener(() {
      if (_scrollController2.position.pixels ==
          _scrollController2.position.maxScrollExtent)
        setState(() {
          flag = false;
        });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        setState(() {
          flag = true;
        });
      }

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
        context.bloc<ProductBloc>().add(ProductGetMoreDataEvent());
    });
  }

  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductsState>(builder: (context, state) {
      return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state2) {

            if (state2 != InitialState())
              return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Home Screen")),
            backgroundColor: Color(0xFF4ab3b5),
            elevation: 0.1,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
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
                color: Color(0xffE7E7E7),
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
                            child: Image.network(imgURL, fit: BoxFit.fill),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 10.0,
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,fontFamily: "Arial"
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "See more",
                              style:
                                  TextStyle(color: Color(0xff3A1DEC), fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "Arial"),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
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
                  Container(height: 10,width: MediaQuery.of(context).size.width,
                  color: Colors.white),

                  /// ListView Category

                  /// GridView  of List categorylevel2


                      Row(
                        children: <Widget>[
                          Container(
                              height: 100,
                              width:MediaQuery.of(context).size.width ,
                               color: Colors.white,



                              child: ListView.builder(


                                  scrollDirection: Axis.horizontal,
                                  itemCount: context.bloc<CategoryBloc>().list_cat_1[0].listSub_cat.length,

                                  itemBuilder:(context,index)
                                  {
                                    CategoryLevel2 category= context.bloc<CategoryBloc>().list_cat_1[0].listSub_cat[index];
                                    return Padding(

                                      padding: EdgeInsets.only(right: 0),
                                      child:GestureDetector(
                                          child: Container(
                                            width: 70,
                                            height: 100,
                                            margin: index!=0? EdgeInsets.only(top:5,bottom: 5,left:10):EdgeInsets.only(top:5,bottom: 5),
                                            decoration: BoxDecoration(),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white,border: Border.all(color: Colors.grey.withOpacity(0.3))),
                                                    child: Center(child:ClipRRect(
                                                      borderRadius: BorderRadius.circular(25),
                                                      child: Image.network(category.icon !=null?"https://fashionshopuit-server.azurewebsites.net/image/"+category.icon : "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg" ,fit: BoxFit.fill,
                                                        width: 25,
                                                        height: 25,

                                                        colorBlendMode: BlendMode.colorBurn,
                                                      ),
                                                    )
                                                    ),

                                                  ),

                                                  Container(
                                                    height: 40,

                                                    child: Center(
                                                      child: Text(category.name,style: TextStyle(fontSize: 13,color:Colors.black),maxLines: 2,textAlign: TextAlign.center,),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(
                                                builder: (context)=> BlocProvider<ProductBloc>(
                                                    create: (context){
                                                      return ProductBloc(

                                                      )..add(ProductByCategoryCodeEvent(category_code: category.level_code));
                                                    },
                                                    child: ProductWithCatLv3_Screen(title: category.name,categoryLevel2: category,)
                                                )
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

                  SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 2,left:2),
                    height: 30,

                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border.all(color:Colors.grey.withOpacity(0.5))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                        GestureDetector(
//                          child: Container(
//                            child: FlatButton.icon(
//                                onPressed: () {
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              Filter_Screen() //bloc: context.bloc<ProductBloc>()
//                                          ));
//                                },
//                                icon: Icon(
//                                  Icons.filter_list,
//                                  color: Colors.black,
//                                ),
//                                label: Text("Filters")),
//                          ),
//                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) =>
//                                        Filter_Screen() //bloc: context.bloc<ProductBloc>()
//                                    ));
//                          },
//                        ),
                        Container(

                          child: GestureDetector(
                            child: FlatButton.icon(
                                onPressed: () {

                                  showModalBottomSheet(
                                      context: context,
                                      builder: (_) {
                                        return  Column(
                                          children: <Widget>[
                                            ListTile(
                                              title: Text("Giá: Cao -> Thấp"),
                                              onTap: () {

                                                  value ="Giá: Cao -> Thấp";
                                                  Navigator.pop(context);
                                                 // context.bloc<ProductBloc>().add(ProductGetMoreDataEvent());


                                              },
                                            ),
                                            ListTile(
                                              title: Text("Giá: Thấp -> Cao"),
                                              onTap: () {
                                                setState(() {
                                                  value ="Giá: Thấp -> Cao";
                                                });
                                              },
                                            ),
                                            ListTile(
                                              title: Text("Giá: Không sắp xếp"),
                                              onTap: () {
                                                setState(() {
                                                  value ="Giá: Không sắp xếp";
                                                });
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.import_export,
                                  color: Colors.black,
                                ),
                                label: Text(value)),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height - 180,
                        child: CustomScrollView(
                            shrinkWrap: true,
                            primary: false,
                            physics: flag == true
                                ? NeverScrollableScrollPhysics()
                                : ClampingScrollPhysics(),
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            slivers: <Widget>[
                              SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      (MediaQuery.of(context).size.width / 2 -
                                              40) /
                                          (MediaQuery.of(context).size.height /
                                                  3 +
                                              15),
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 0.0,
                                  //childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      color: Colors.white.withOpacity(0),
                                      //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                      child: GestureDetector(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3 +
                                                20,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              backgroundBlendMode:
                                                  BlendMode.colorBurn,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.white),
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
                                            child: ProductCard(
                                              product: state.data[index],
                                              index: index,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Product_Detail(
                                                          product:
                                                              state.data[index],
                                                          index: index,
                                                          email: context
                                                              .bloc<LoginBloc>()
                                                              .getEmail,
                                                        )));
                                          }),
                                    );
                                  },
                                  childCount: state.data.length,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
            return Center(child: CircularProgressIndicator());
      });
    });
  }
}
