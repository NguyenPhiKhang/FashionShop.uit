import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/my_oder_bloc/my_order_bloc.dart';
import 'package:fashionshop/src/bloc/my_oder_bloc/my_order_event.dart';
import 'package:fashionshop/src/resources/MyOrder_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFF4ab3b5),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Info(
            image: "assets/Avarta.png",
            name: "Quang Khang",
            email: "quangkhang20899@gmail.com",
          ),

          Container(
            height: MediaQuery.of(context).size.height-300-60,
            child: SingleChildScrollView(

              scrollDirection: Axis.vertical,
              child: Column(

                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Đơn hàng",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Arial"),),
                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,)
                        ],
                      ),
                    ),
                    onTap: (){

                      Navigator.push(
                          context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BlocProvider<MyOrderBloc>(
                          create: (context){
                            return MyOrderBloc(

                            )..add(InitiateEvent(person_id: context.bloc<LoginBloc>().getid));
                          },
                          child: MyOrder_Screen()
                      )
                      )
                      );
                    },
                  ),

//                  GestureDetector(
//                    child: Container(
//                      height: 50,
//                      padding: EdgeInsets.only(left: 10,right: 10),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Text("Địa chỉ giao hàng",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Arial"),),
//                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,)
//                        ],
//                      ),
//                    ),
//                    onTap: (){},
//                  ),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Phương thức thanh toán",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Arial"),),
                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,)
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),GestureDetector(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Khuyến mãi",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Arial"),),
                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,)
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),GestureDetector(

                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Reviews của bạn",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Arial"),),
                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,)
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Thiết lập tài khoản",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Arial"),),
                          Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,)
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}










/// Info
///
///


class Info extends StatelessWidget {
  const Info({
    Key key,
    this.name,
    this.email,
    this.image,
  }) : super(key: key);
  final String name, email, image;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 220,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 170, //150
              color: Color(0xFF4ab3b5),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5), //10
                  height: 120, //140
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4, //8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(image),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22, // 22
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5), //5
                Text(
                  email,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}