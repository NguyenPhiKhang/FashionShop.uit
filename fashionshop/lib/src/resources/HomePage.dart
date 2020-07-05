
import 'package:fashionshop/src/CardView/ProductCard.dart';
import 'package:fashionshop/src/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Product_Detail.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  int _current =0;
//  var productList  = [
//    new Product("Name","https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg", "ádkajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdsadhsadjashdj",100, "20",4.7),
//    new Product("Name","https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg", "De123213213123s", 100, "20",2.3),
//    new Product("Name","https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg", "Dádadsadaes", 99, "20",3.8),
//    new Product("Name","https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg", "Deadssadasds",50, "20",4.5),
//    new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "Deadsadsadasds", 79, "20",4.2),
//  ];
  var productList  = [
//    new Product("Name","https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg", "<p> ádkajaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdsadhsadjashdj </p>",100, "20",4.7),
//    new Product("Name","https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg", "<p>De123213213123s</p>", 100, "20",2.3),
//    new Product("Name","https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg", "<p>Dádadsadaes</p>", 99, "20",3.8),
//    new Product("Name","https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg", "<p>Dádadsadaes</p>",50, "20",4.5),
//    new Product("Name","https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg", "<p>Dádadsadaes</p>", 79, "20",4.2),
  ];


  List imgList =[
        'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg',
        'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg',
        'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg',
        'https://www.pano-verschluss.com/wp-content/uploads/2018/09/10384456_998450296913710_7463963190715079729_n.jpg'
  ];

  CarouselSlider carouselSlider;
List<T> map<T> (List list, Function handler){
 List<T> result =[];
 for(var i=0;i<list.length;i++)
   {
     result.add(handler(i,list[i]));
   }
 return result;
}


  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Fashion App"),
  backgroundColor: Colors.redAccent,
  elevation: 0.1,

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
      body: Container(
        decoration: BoxDecoration(color:Color(0xffE5E5E5),backgroundBlendMode: BlendMode.colorBurn),
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,


              children: <Widget>[
                SizedBox(height: 10,),
carouselSlider=CarouselSlider(
  height: 400.0,
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
      _current=index;
    });
  },
  items: imgList.map((imgURL){
return Builder(
  builder: (BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
            color: Colors.green
      ),
      child: Image.network(imgURL,fit: BoxFit.fill),
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
                  children: map<Widget>(imgList,(index,url) {
                    return
                      GestureDetector(
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 10.0),
                          decoration: BoxDecoration(shape: BoxShape.circle,
                              color: _current == index ? Colors.red : Colors.black12),

                        ),
                        onTap: (){

                        },
                      );
                  }
                  )
                ),



                SizedBox(height: 20.0,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

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

                             },
                           )
                         ],
                ),

                SizedBox(height: 20.0,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[

                    Text("Female Fashion",
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

                      },
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3+40,



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
                                  decoration: BoxDecoration(color: Colors.black,backgroundBlendMode: BlendMode.colorBurn,),
                                  child:
                                    ProductCard(product: product,index: index,),

                                ),
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(
                                      builder: (context)=> Product_Detail(product: product,index: index,)
                                  )
                      );
                                     }

                              ),

                        );

                      }

                  )

                ),
                SizedBox(height: 20,),
              ],
            ),

        ),

      ),
    );
  }
}

