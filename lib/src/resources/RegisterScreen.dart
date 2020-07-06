import 'package:fashionshop/src/FirebaseMethod/FirebaseMethod.dart';
import 'package:fashionshop/src/bloc/RegisterBloc/RegisterBloc.dart';
import 'package:fashionshop/src/bloc/RegisterBloc/RegisterEvent.dart';
import 'package:fashionshop/src/bloc/RegisterBloc/RegisterState.dart';
import 'package:fashionshop/src/resources/LoginScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_password = TextEditingController();
  TextEditingController txt_passwordConfirm = TextEditingController();
  TextEditingController txt_name = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterBloc(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterFailure) {
          _onWidgetDidBuild(() {
            _showDialog(context, state.error.toString());
          });
        }
        if (state is RegisterOk) {
          return LoginScreen();
        }
        if (state is RegisterLoading) {
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
                    key:_formKey,
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
                          "Fashion Shop!",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 6),
                        child: Text(
                          "Tạo một tài khoản mới.",
                          style: TextStyle(fontSize: 16, color: const Color(
                              0xff9098b1)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                          child: TextFormField(
                            controller: txt_name,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Không được để trống phần này';
                              }

                              return null;
                            },
                            onChanged: (value)
                            {
                              _formKey.currentState.validate();
                            },
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Họ Tên",
                              labelStyle: TextStyle(fontSize: 17),
                              prefixIcon:
                              Container(
                                  width: 20.0, child: const Icon(Icons.person)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffCED0D2), width: 1.0),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextFormField(
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
                            controller: txt_email,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 17),
                              prefixIcon:
                              Container(
                                  width: 20.0, child: const Icon(Icons.email)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffCED0D2), width: 1.0),
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
                              width: 50.0, child: const Icon(Icons.lock_outline)),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(
                                color: const Color(0xffCED0D2), width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                      Padding(

                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: TextFormField(
                            controller: txt_passwordConfirm,
                              validator: (value) {

                                if(txt_passwordConfirm.text!=txt_password.text)
                                  return 'Xác nhận mật khẩu không đúng.';
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
                              labelText: "Nhập lại mật khẩu",
                              labelStyle: TextStyle(fontSize: 17),
                              prefixIcon: Container(
                                  width: 20.0,
                                  child: const Icon(Icons.lock_outline)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffCED0D2), width: 1.0),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: RaisedButton(
                            onPressed: () {
                              if(_formKey.currentState.validate())
                              context.bloc<RegisterBloc>().add(RegisterButtonPressed(name:txt_name.text ,username:txt_email.text , password: txt_password.text, idPermission:"5eee3d622c331a381bdc6b04"));
                            },
                            child: Text(
                              "Đăng ký",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            color: Color(0xFF4ab3b5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: RichText(
                          text: TextSpan(
                              text: "Bạn đã có tài khoản rồi? ",
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
                                                    LoginScreen()));
                                      },
                                    text: "Đăng nhập",
                                    style: TextStyle(
                                        color: Color(0xcc4199F8),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      }
            )
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
