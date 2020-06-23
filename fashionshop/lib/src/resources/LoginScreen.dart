
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/resources/RegisterScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql-config.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_password = TextEditingController();
QueryMutation  queryMutation = QueryMutation();

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
                "Welcome to Fashion Shop",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 6),
              child: Text(
                "Sign in to continue!",
                style: TextStyle(fontSize: 16, color: const Color(0xff9098b1)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: TextField(
                  controller: txt_email,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Email",
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
              controller: txt_password,
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
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  onPressed: () async {
                   GraphQLClient _client =  graphQLConfiguration.clientToQuery();
 QueryResult result = await _client.query (
QueryOptions(
  documentNode: gql(queryMutation.Login(txt_email.text, txt_password.text)),

)
 );
 if (result.data["data"]!=null)
       print(result.data["data"].toString());

                  },

                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Color(0xFF4ab3b5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              ),
            ),
//            SizedBox(
//              height: 30.0,
//              child: Text(
//                "Or",
//                style: TextStyle(fontSize: 18.0, color: Colors.grey),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//              child: SizedBox(
//                width: double.infinity,
//                height: 60,
//                child: RaisedButton.icon(
//                  onPressed: () {},
//                  icon: Image.asset(
//                    "assets/ic_google.png",
//                    width: 30.0,
//                  ),
//                  label: Text("Login with Google"),
//                  color: Color(0xffffffff),
//                  shape: RoundedRectangleBorder(
//                    side: BorderSide(
//                        color: Color(0xccd2d2d2),
//                        width: 1,
//                        style: BorderStyle.solid),
//                    borderRadius: BorderRadius.all(
//                      Radius.circular(15.0),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//              child: SizedBox(
//                width: double.infinity,
//                height: 60,
//                child: RaisedButton.icon(
//                  onPressed: () {},
//                  icon: Image.asset(
//                    "assets/ic_google.png",
//                    width: 30.0,
//                  ),
//                  label: Text("Login with Facebook"),
//                  color: Color(0xffffffff),
//                  shape: RoundedRectangleBorder(
//                    side: BorderSide(
//                        color: Color(0xffd2d2d2),
//                        width: 1,
//                        style: BorderStyle.solid),
//                    borderRadius: BorderRadius.all(
//                      Radius.circular(15.0),
//                    ),
//                  ),
//                ),
//              ),
//            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
              child: RichText(
                  text: TextSpan(
                text: "Forogt Password?",
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
                    text: "Don't have a account? ",
                    style: TextStyle(color: Color(0xff606470), fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                          text: "Register",
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
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Login with",
                          style: TextStyle(color: Color(0xff808080)),
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
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: IconButton(
                      onPressed: () {print("google click!");},
                      icon: Image.asset(
                        "assets/ic_google.png",
                        width: 30,
                      ),
                    )
                ),
                Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 5, top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: IconButton(
                      onPressed: () {print("facebook click!");},
                      icon: Image.asset(
                        "assets/ic_facebook.png",
                        width: 30,
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
