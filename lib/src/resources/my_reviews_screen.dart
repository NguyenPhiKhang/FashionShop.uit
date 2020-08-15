import 'package:flutter/material.dart';
class MyReviewScreen extends StatefulWidget {
  @override
  _MyReviewScreenState createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

    textTheme: TextTheme(),
    backgroundColor: Color(0xFF4ab3b5),
    title: Text(
    "Đánh giá của tôi",
    style: TextStyle(color: Colors.white),
    ),
        ),
      body: Container(),
    );
  }
}
