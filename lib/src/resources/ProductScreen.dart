import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Product_Detail.dart';

class Products_Screen extends StatefulWidget {
  final String title;
  final int level_code;
  Products_Screen({@required this.title,@required this.level_code});
  @override
  _Products_ScreenState createState() => _Products_ScreenState();
}

class _Products_ScreenState extends State<Products_Screen> {
  ScrollController _scrollController= ScrollController();

  @override
  void initState()
  {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent) {
        context.bloc<ProductBloc>().add(
            ProductByCategoryCodeEvent(category_code: widget.level_code));
      }
    });

  }

  Widget build(BuildContext context) {
    return  BlocBuilder<ProductBloc,ProductsState>(
           builder:(context,state) {
             return Scaffold(
               backgroundColor: Color(0xffE7E7E7),
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
                     onPressed: () {},
                     icon: Icon(Icons.search, color: Colors.white, size: 30,),

                   ),

                 ],
               ),
               body: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     height: 30,
                     color: Colors.yellowAccent.withOpacity(0.50),

                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Container(
                           child: FlatButton.icon(onPressed: () {},
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
                   Stack(
                     children: <Widget>[
                       Container(
                         //margin: EdgeInsets.only(left: 5),
                         color: Colors.white,

                         height: MediaQuery.of(context).size.height - 180,
                         child: CustomScrollView(
                             shrinkWrap: true,
                             primary: false,

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
                                       EdgeInsets.only(top: 10, ),
                                       padding: EdgeInsets.only(left: 10,bottom: 8,right:10),
                                       decoration: BoxDecoration(
                                         color: Colors.white.withOpacity(0),
                                         borderRadius: BorderRadius.circular(8),
                                       ),

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
                                               boxShadow: [
                                                 BoxShadow(
                                                   color: Colors.grey.withOpacity(0.5),
                                                   spreadRadius: 2,
                                                   blurRadius: 4,
                                                   offset: Offset(0, 0), // changes position of shadow
                                                 ),
                                               ],
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.black.withOpacity(0.5),
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
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         Product_Detail(
//                                                           product:
//                                                           state.data[index],
//                                                           index: index,
//                                                           email: context
//                                                               .bloc<LoginBloc>()
//                                                               .getEmail,
//                                                         )));
                                           }),
                                     );
                                   },
                                   childCount: state.data.length,
                                 ),
                               ),
                             ]),
                       ),
                       if  (state is Loading)
                         Positioned(
                           bottom: 10,left: MediaQuery.of(context).size.width/2-15,
                           child: Container(
                             width: 30,
                             height: 30,
                             child:
                             CircularProgressIndicator(backgroundColor: Colors.red,) ,
                           ),
                         )
                     ],

                   ),
                 ],
               ),
             );
           }
      );

  }
}
