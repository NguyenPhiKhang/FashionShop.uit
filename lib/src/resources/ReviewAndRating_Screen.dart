
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';


class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int max = 14;
  bool _isLoadingChoose = false;
  bool _isLoadingUpload = false;
  List<int> listStar = [12, 5, 4, 2, 2];
  List<String> listImage = [
    "https://i.pinimg.com/236x/30/87/8d/30878dc76c22265aa23b6c0328886113.jpg",
    "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg",
    "https://i.pinimg.com/236x/96/54/1e/96541ecef90b955a1f3b7f629bb41cc3.jpg",
    "https://i.pinimg.com/236x/5b/8c/2f/5b8c2fcde3715bf0727f93164be0d58e.jpg",
    "https://i.pinimg.com/236x/65/88/d1/6588d14ad9b2df7bab9f9b68c8cfe639.jpg",
  ];
  PersistentBottomSheetController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        backgroundColor: Color(0xFF4ab3b5),
        elevation: 0.1,
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
        actions: <Widget>[],
      ),
      body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[

                Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text("4.3",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontFamily: "Metropolis",
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "23" + " đánh giá",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black87,
                                  fontFamily: "Metropolis"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 70,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              width: (MediaQuery
                                  .of(context)
                                  .size
                                  .width - 70) / 3,
                              child: Column(
                                  children: List.generate(5, (i) {
                                    return Container(
                                      height: 20,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .end,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: List.generate(
                                              5 - i, (index) {
                                            return Icon(Icons.star,
                                                color: Color(0xffFFBA49),
                                                size: 14);
                                          }),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width:
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .width - 70) / 3 * 2 -
                                  20,
                              child: Column(
                                  children: List.generate(5, (i) {
                                    return Container(
                                      height: 20,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .end,
                                          children: <Widget>[
                                            Container(
                                                width: ((MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width -
                                                    70) /
                                                    3 *
                                                    2 -
                                                    40) *
                                                    (listStar[i] / max),
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffDB3022),
                                                    borderRadius:
                                                    BorderRadius.circular(4))),
                                            Text(listStar[i].toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 8,
                                                    fontWeight: FontWeight
                                                        .w500))
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 5,
                  color: Color(0xffE5E5E5),
                  margin: EdgeInsets.only(bottom: 0),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Reviews:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Nancy",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Metropolis"),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      SmoothStarRating(
                                        allowHalfRating: true,
                                        starCount: 5,
                                        size: 20,
                                        rating: 4,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        color: Colors.amber,
                                        borderColor: Colors.grey,
                                        spacing: 0.0,
                                      ),
                                      Text(
                                        "(4)",
                                      )
                                    ]),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "11:20:02 , 20/08/2019",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        padding:
                                        EdgeInsets.fromLTRB(15, 15, 15, 15),
                                        child: Text(
                                          "Nice product and your delivery is so good. I'm very satified.",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                                height: 150,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listImage.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Image.network(
                                            listImage[index],
                                            fit: BoxFit.fill,
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width /
                                                4,
                                            height: 150,
                                            colorBlendMode: BlendMode.darken,
                                          ));
                                    }))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://i.pinimg.com/236x/b5/0e/31/b50e311008e481dafae4be71f44f5d1f.jpg"),
                              radius: 15,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Nancy",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Metropolis"),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      SmoothStarRating(
                                        allowHalfRating: true,
                                        starCount: 5,
                                        size: 20,
                                        rating: 5,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        color: Colors.amber,
                                        borderColor: Colors.grey,
                                        spacing: 0.0,
                                      ),
                                      Text(
                                        "(5)",
                                      )
                                    ]),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "11:20:02 , 20/08/2019",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        padding:
                                        EdgeInsets.fromLTRB(15, 15, 15, 15),
                                        child: Text(
                                          "Sản phẩm thật tuyệt vời.",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                                height: 150,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listImage.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Image.network(
                                            listImage[index],
                                            fit: BoxFit.fill,
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width /
                                                4,
                                            height: 150,
                                            colorBlendMode: BlendMode.darken,
                                          ));
                                    }))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://i.pinimg.com/originals/c2/a2/b7/c2a2b72d1e852146b3d539115c85f0fe.jpg"),
                              radius: 15,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
