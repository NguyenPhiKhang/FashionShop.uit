import 'package:fashionshop/src/resources/LoginScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: SingleChildScrollView(
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
                "Let's Get Started",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 6),
              child: Text(
                "Create an new account",
                style: TextStyle(fontSize: 16, color: const Color(0xff9098b1)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    labelStyle: TextStyle(fontSize: 17),
                    prefixIcon:
                        Container(width: 20.0, child: const Icon(Icons.person)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xffCED0D2), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Your Email",
                    labelStyle: TextStyle(fontSize: 17),
                    prefixIcon:
                        Container(width: 20.0, child: const Icon(Icons.email)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xffCED0D2), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                )),
            TextField(
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
                      BorderSide(color: const Color(0xffCED0D2), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Password Again",
                    labelStyle: TextStyle(fontSize: 17),
                    prefixIcon: Container(
                        width: 20.0, child: const Icon(Icons.lock_outline)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xffCED0D2), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                    print("click login!");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Color(0xFF4ab3b5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: RichText(
                text: TextSpan(
                    text: "Already have a account? ",
                    style: TextStyle(color: Color(0xff606470), fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          text: "Login",
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
    ));
  }
}
