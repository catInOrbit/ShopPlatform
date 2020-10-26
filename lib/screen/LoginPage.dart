import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 1),
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'ExpShop',
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Xin chào',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Đăng nhập với tài khoản của bạn',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        onChanged: (text) {
                          setState(() {
                            username = text;
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
                        decoration: const InputDecoration(
                          labelText: 'Mật khẩu',
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
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(360),
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FlatButton(
                          onPressed: () {
                            if (username == 'user' && password == '123') {
                              return Navigator.pushNamed(context, '/HomePage');
                            }
                            if (username == 'shop' && password == '123') {
                              return Navigator.pushNamed(
                                  context, '/HomePageShop');
                            }
                          },
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
