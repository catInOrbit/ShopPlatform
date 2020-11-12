import 'package:ExpShop/bloc/authentication/authentication_bloc.dart';
import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/bloc/global.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/models/user.dart' as UserShopPlatform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email, password;
  TextEditingController usernameController;
  TextEditingController passwordController;
  final FirebaseAPI firebaseAPI = FirebaseAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firebaseAPI.saveUsers();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 1),
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          hintText: 'Nhập Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(360),
                            borderSide: BorderSide(),
                          ),
                          filled: true,
                          fillColor: WHITE,
                        ),
                        onChanged: (text) {
                          setState(() {
                            email = text;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            password = text;
                          });
                        },
                        obscureText: true,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          hintText: 'Nhập mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(360),
                            borderSide: BorderSide(),
                          ),
                          filled: true,
                          fillColor: WHITE,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Quên mật khẩu',
                            style: TextStyle(fontSize: 14, color: WHITE),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.greenAccent, YELLOW]),
                          borderRadius: BorderRadius.circular(360),
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FlatButton(
                          onPressed: () async {
                            // if (email == 'user' && password == '123') {
                            //   return Navigator.pushNamed(context, '/HomePage');
                            // }
                            // if (email == 'shop' && password == '123') {
                            //   return Navigator.pushNamed(
                            //       context, '/HomePageShop');
                            // }
                            try {
                              final newUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                _auth.currentUser.getIdToken();
                                Fluttertoast.showToast(
                                    msg: "Login Successfull",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                prefs.setString('email', email);

                                return Navigator.pushNamed(
                                    context, '/HomePage');

                              }
                            } catch (e) {
                            
                            }
                          },
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 20, color: GREENBLACK),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 85,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn chưa có tài khoản? ',
                        style: TextStyle(fontSize: 15)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/RegisterPage");
                      },
                      child: Text('Đăng ký',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
