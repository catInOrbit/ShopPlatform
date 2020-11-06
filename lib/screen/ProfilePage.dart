import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.green,
        //   ),
        //   onPressed: () {},
        // ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              SizedBox(height: 15),
              Container(
                child: Stack(
                  children: [
                    CoverImage(),
                    Positioned(
                        bottom: 0,
                        left: 120,
                        child: Stack(
                          children: [
                            Avatar(),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 4,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                        color: Colors.green),
                                    child:
                                        Icon(Icons.edit, color: Colors.white)))
                          ],
                        )),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green),
                          child: Icon(Icons.edit, color: Colors.white)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField(
                  "Họ và tên: ", "Nhập họ và tên", "", "Nguyễn Văn A"),
              buildTextField(
                  "Email: ", "Email của bạn", "", "nguyenvana@gmail.com"),
              buildTextField("Năm sinh: ", "dd/MM/yyyy", "", "12/02/1998"),
              buildTextField("Địa chỉ: ", "Nhập địa chỉ", "address",
                  "Nguyễn Văn Hưởng, P, Quận 2, Thành phố Hồ Chí Minh"),
              buildTextField("Số điện thoại: ", "Nhập số điện thoại", "phone",
                  "0123456789"),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text("Huỷ",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Lưu",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, String type, String text) {
    final TextEditingController _textController = new TextEditingController();
    _textController.text = text;
    var keyType;
    var maxLine = 1;
    var maxLength = 50;
    if (type == 'phone') {
      keyType = TextInputType.number;
      maxLength = 10;
    } else if (type == 'address' || type == 'description') {
      keyType = TextInputType.multiline;
      maxLine = 5;
      maxLength = 500;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: _textController,
        keyboardType: keyType,
        maxLines: maxLine,
        maxLength: maxLength,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Colors.black,
            )),
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(left: 16.0, bottom: 4.0),
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage('assets/images/shop.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(
            width: 4, color: Theme.of(context).scaffoldBackgroundColor),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 10))
        ],
        shape: BoxShape.circle,
        image: new DecorationImage(
            image: new AssetImage('assets/images/user.png'), fit: BoxFit.fill),
      ),
    );
  }
}
