import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CreateProductScreen extends StatefulWidget {
  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  DateTime _dateTime = DateTime.now();
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    if (null == tmpFile) {
      setStatus(error);
      return;
    }

    String fileName = tmpFile.path.split('/').last;

    upload(fileName);
  }

  upload(String fileName) {
    http.post('http://finenut.in/demo/uploadData.php', body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : error);
    }).catchError((error) {
      setStatus(error);
    });
  }

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
            Text(
              "Thêm Sản Phẩm",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            buildTextField('Tên Sản Phẩm', 'Nhập tên sản phẩm'),
            buildTextField('Danh Mục', 'Nhập danh mục'),
            Text('Hạn sử dụng'),
            Container(
              child: Row(
                children: [
                  RaisedButton.icon(
                      icon: Icon(Icons.calendar_today),
                      label: Text(''),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2050))
                            .then((value) {
                          setState(() {
                            _dateTime = value;
                          });
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      DateFormat('dd-MM-yyyy').format(_dateTime),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Ảnh sản phẩm'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<File>(
                  future: file,
                  builder:
                      (BuildContext context, AsyncSnapshot<File> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        null != snapshot.data) {
                      tmpFile = snapshot.data;
                      base64Image =
                          base64Encode(snapshot.data.readAsBytesSync());
                      return Container(
                        margin: EdgeInsets.all(15),
                        child: Material(
                          elevation: 3.0,
                          child: Image.file(
                            snapshot.data,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else if (null != snapshot.error) {
                      return const Text(
                        'Error!',
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.all(15),
                        child: Material(
                          elevation: 3.0,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                child: Image.asset(
                                    'assets/images/placeholder-image.png'),
                              ),
                              InkWell(
                                onTap: () {
                                  chooseImage();
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, right: 10.0),
                                  child: Icon(
                                    Icons.edit,
                                    size: 30.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            buildTextField('Giá', 'Nhập giá'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    uploadImg();
                  },
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Tạo",
                    style: TextStyle(
                        fontSize: 18, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        decoration: InputDecoration(
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
