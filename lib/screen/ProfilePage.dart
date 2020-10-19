import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(
                        'https://znews-photo.zadn.vn/w660/Uploaded/izhqv/2019_11_24/7A073345F2F74833860073F1EE4892DE.jpeg',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Họ và tên', style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: InputDecoration(),
                ),
                Text('Năm sinh', style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'dd/MM/yyyy',
                    prefixIcon: Icon(FontAwesomeIcons.calendar),
                  ),
                ),
                Text('Địa chỉ:', style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: InputDecoration(),
                ),
                Text('Số điện thoại:', style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: InputDecoration(),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: Colors.blue,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.1,
            child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(360)),
                onPressed: () {
                  print("object");
                },
                child: Text('Update')),
          )
        ],
      ),
    );
  }
}
