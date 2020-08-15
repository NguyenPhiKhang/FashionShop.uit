
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryBloc.dart';
import 'package:fashionshop/src/bloc/CategoryBloc/CategoryState.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/model/Category.dart';
import 'package:fashionshop/src/resources/ProductWithCatLv3_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//class Category
//{
//  final String name;
//  final String image;
//   const Category({this.name,this.image});
//}
//class Explore_TabValue
//{
//  final String title;
//  final List<Category> category;
//  const Explore_TabValue({this.title,this.category});
//}
//const List<Category> list_category= <Category>[
//  Category(name: "Hat",image:          "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg" ),
//  Category(name: "Clothes",image:      "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg" ),
//   Category(name: "Glasses",image:      "https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg" ),
//   Category(name: "Accesories",image:   "https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg" ),
//   Category(name: "Shoes",image:        "https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg" )
// ];
//
//const List<Explore_TabValue> list_Explore_TabValue =  [
//  Explore_TabValue(title: "Women",category: list_category),
//  Explore_TabValue(title: "Men",category: list_category),
//  Explore_TabValue(title: "Boy",category: list_category),
//  Explore_TabValue(title: "Girl",category: list_category),
//  Explore_TabValue(title: "Kid",category: list_category),
//
//];

class Explore_TabPage extends StatelessWidget {
  final CategoryLevel1 categoryLevel1;
  const Explore_TabPage({this.categoryLevel1});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,

      child: Column(

        children: List.generate(categoryLevel1.listSub_cat.length, (i) {
          return   GestureDetector(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(
                builder: (context)=> BlocProvider<ProductBloc>(
                create: (context){
                  return ProductBloc(

                  )..add(ProductByCategoryCodeEvent(category_code: categoryLevel1.listSub_cat[i].level_code));
                },
                   child: ProductWithCatLv3_Screen(title: categoryLevel1.listSub_cat[i].name,categoryLevel2: categoryLevel1.listSub_cat[i],)
                )
            )
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),


            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

            child: Row(
              children: <Widget>[
                Container(width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height *0.7 / 5,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),

                  ),

                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 8,right: 8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))),
                        height:MediaQuery
                            .of(context)
                            .size
                            .height *0.7/ 5 ,
                        width: (MediaQuery
                            .of(context)
                            .size
                            .width - 42)/2,
                        child: Center(
                          child: Text(categoryLevel1.listSub_cat[i].name,
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),textAlign: TextAlign.center,),),
                      ),
                      Container(
                        height:MediaQuery
                            .of(context)
                            .size
                            .height *0.7/ 5,
                        width: 2,
                        color: Colors.blueGrey,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                            child: Image.network(
                              categoryLevel1.listSub_cat[i].imgUrl ==null ? "https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg" : "https://fashionshopuit-server.azurewebsites.net/image/"+categoryLevel1.listSub_cat[i].imgUrl,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height *0.7/ 5,
                              width: (MediaQuery
                                  .of(context)
                                  .size
                                  .width - 42)/2,
                              fit: BoxFit.fill,)
                        ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );})





      ),
    );
  }
}



class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state != InitialState())
        return MaterialApp(
            home: DefaultTabController(
          length: context.bloc<CategoryBloc>().list_cat_1.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
              textTheme: TextTheme(),
              backgroundColor: Color(0xFF4ab3b5),
              title: Text(
                "Danh mục",
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.white60,
                isScrollable: true,
                tabs: context.bloc<CategoryBloc>().list_cat_1.map<Widget>((value) {
                  return Tab(
                    text: value.name,
                  );
                }).toList(),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  ),
              child: TabBarView(
                children:
                context.bloc<CategoryBloc>().list_cat_1.map<Widget>(( value) {
                  return Explore_TabPage(categoryLevel1 : value);
                }).toList(),
              ),
            ),
          ),
        ));
      return Center(child: CircularProgressIndicator());
    }
    );
  }
}
