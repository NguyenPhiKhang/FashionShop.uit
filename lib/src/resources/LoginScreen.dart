import 'package:fashionshop/src/bloc/Login_Bloc/LoginBloc.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginEvent.dart';
import 'package:fashionshop/src/bloc/Login_Bloc/LoginState.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductBloc.dart';
import 'package:fashionshop/src/bloc/ProductBloc/ProductEvent.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/resources/ExploreScreen.dart';
import 'package:fashionshop/src/resources/HomePage.dart';
import 'package:fashionshop/src/resources/HomeScreen.dart';
import 'package:fashionshop/src/resources/ProductScreen.dart';
import 'package:fashionshop/src/resources/RegisterScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.bloc<LoginBloc>();

    final _formKey = GlobalKey<FormState>();
    return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginFailure) {
              _onWidgetDidBuild(() {

                _showDialog(context,state.error.toString());

              });
            }
            if (state is LoginOk) {

              return HomeScreen(Myname: context.bloc<LoginBloc>().getName);

            }
            if(state is LoginLoading) {
              return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  )
              );
            }


        return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              constraints: BoxConstraints.expand(),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          child: Image.asset(
                            'assets/fashion_logo.png',
                            width: 250.0,
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          "Fashion Shop",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 6),
                        child: Text(
                          "Đăng ký để tiếp tục!",
                          style: TextStyle(fontSize: 16, color: const Color(
                              0xff9098b1)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                          child: TextFormField(
                            controller: txt_email,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Không được để trống phần này';
                              }
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);

                              if(!regex.hasMatch(value)) return 'Tên email không đúng cấu trúc';
                              return null;
                            },
                            onChanged: (value)
                            {
                              _formKey.currentState.validate();
                            },
                            style: TextStyle(fontSize: 18, color: Colors
                                .black),
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 17),
                              prefixIcon:
                              Container(width: 20.0,
                                  child: const Icon(Icons.email)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffCED0D2),
                                    width: 1.0),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                              ),
                            ),
                          )),
                      TextFormField(
                        controller: txt_password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Không được để trống phần này';
                          }
                          if(value.length <6)
                            return 'Mật khẩu phải từ 6 kí tự trở lên.';


                          return null;
                        },
                        onChanged: (value)
                        {
                          _formKey.currentState.validate();
                        },
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        obscureText: true,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 17),
                          prefixIcon: Container(
                              width: 50.0, child: const Icon(
                              Icons.lock_outline)),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(
                                color: const Color(0xffCED0D2), width: 1.0),
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: RaisedButton(
                            onPressed: (){
                              if(_formKey.currentState.validate())
                             loginBloc.add(LoginButtonPressed(username: txt_email.text,password: txt_password.text));
                            },
//                          onPressed: () async {
//                            QueryResult result = await _client.query(
//                                QueryOptions(
//                                    documentNode: gql(Login),
//                                    variables: {
//                                      "email": txt_email.text,
//                                      "password": txt_password.text
//                                    }
//                                ));
//                            print(result.hasException);
//                            if (!result.hasException) {
//                              _showDialog(context);
//                            }
//                          },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            color: Color(0xFF4ab3b5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                        child: RichText(
                            text: TextSpan(
                              text: "Quên mật khẩu?",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Forgot password?");
                                },
                              style: TextStyle(
                                  color: Color(0xcc4199F8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: RichText(
                          text: TextSpan(
                              text: "Chưa có tài khoản? ",
                              style: TextStyle(
                                  color: Color(0xff606470), fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen()));
                                      },
                                    text: "Đăng ký",
                                    style: TextStyle(
                                        color: Color(0xcc4199F8),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 1,
                                color: Color(0x99808080),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Login with",
                                    style: TextStyle(
                                        color: Color(0xff808080)),
                                  )),
                              Container(
                                width: 100,
                                height: 1,
                                color: Color(0x99808080),
                              )
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 5, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(25))),
                              child: IconButton(
                                onPressed: () {
                                  print("google click!");
                                },
                                icon: Image.asset(
                                  "assets/ic_google.png",
                                  width: 30,
                                ),
                              )),
                          Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(left: 5, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(25))),
                              child: IconButton(
                                onPressed: () {
                                  print("facebook click!");
                                },
                                icon: Image.asset(
                                  "assets/ic_facebook.png",
                                  width: 30,
                                ),
                              ))
                        ],
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        child:
                        state is LoginLoading ? CircularProgressIndicator(backgroundColor: Colors.red,) : null,
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }


  void _showDialog(BuildContext context,String error) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error!"),
          content: new Text(error),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void _onWidgetDidBuild(Function() callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
