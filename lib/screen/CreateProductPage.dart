import 'package:ExpShop/bloc/data_repository.dart';
import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/categoryProduct.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class CreateProductScreen extends StatefulWidget {
  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  ProductItem product = ProductItem();
  // Stream<QuerySnapshot> snapshot;
  DateTime _dateTime = DateTime.now();
  // List<CategoryProduct> listCategory = new List();
  String status = '';
  String _uploadedFileURL;
  File _image;
  String error = 'Error';
  CategoryProduct categoryProduct = listCategory[0];
  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      _image = image;
    });
  }

  Future uploadFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      _image = image;
    });
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('product/${path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        product.image = _uploadedFileURL;
      });
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  buildTextField(String labelText, String placeholder, String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        onChanged: (text) {
          setState(() {
            if (name == "productName") {
              product.productName = text;
              print(product.productName);
            } else if (name == "price") {
              product.price = double.parse(text);
            } else if (name == "promotionalPrice") {
              product.promotionalPrice = int.parse(text);
            } else if (name == "quantity") {
              product.quantity = int.parse(text);
            }
          });
        },
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

  // dropDownCateogry(BuildContext context) {
  //   return DropdownButton<String>(
  //     value: "",
  //     icon: Icon(Icons.arrow_downward),
  //     iconSize: 24,
  //     elevation: 16,
  //     style: TextStyle(color: Colors.deepPurple),
  //     underline: Container(
  //       height: 2,
  //       color: Colors.deepPurpleAccent,
  //     ),
  //     onChanged: (String newValue) {
  //       setState(() {
  //         dropdownValue = newValue;
  //       });
  //     },
  //     items: <String>['One', 'Two', 'Free', 'Four']
  //         .map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }

  dropDownMenuCategory(BuildContext context) {
    return DropdownButton<CategoryProduct>(
      value: categoryProduct,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (CategoryProduct newValue) {
        setState(() {
          categoryProduct = newValue;
          product.categoryID = categoryProduct.categoryID;
          print(product.categoryID);
        });
      },
      items: listCategory
          .map<DropdownMenuItem<CategoryProduct>>((CategoryProduct value) {
        return DropdownMenuItem<CategoryProduct>(
          value: value,
          child: Text(value.categoryName),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // snapshot = FirebaseAPI().getAllCategories();

    // snapshot.forEach((element) {
    //   element.docs.asMap().forEach((key, value) {
    //     listCategory.add(CategoryProduct(
    //       categoryName: element.docs[key]["categoryName"],
    //       categoryID: element.docs[key]["categoryID"],
    //     ));
    //     print(listCategory.length);
    //   });
    // });
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
            buildTextField('Tên Sản Phẩm', 'Nhập tên sản phẩm', "productName"),
            dropDownMenuCategory(context),
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

                            product.expirationDate = value;
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
                Container(
                  margin: EdgeInsets.all(15),
                  child: Material(
                    elevation: 3.0,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        _image != null
                            ? Container(
                                child:
                                    Image.asset(_image.path, fit: BoxFit.fill),
                                height: 300,
                                width: 300,
                              )
                            : Container(
                                child: Image.asset(
                                  'assets/images/placeholder-image.png',
                                  fit: BoxFit.fill,
                                ),
                                height: 300,
                                width: 300,
                              ),
                        InkWell(
                          onTap: () {
                            // chooseFile();
                            uploadFile();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0, right: 10.0),
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
                )
              ],
            ),
            SizedBox(height: 20),
            buildTextField('Số lượng', 'Nhập số lượng', "quantity"),
            buildTextField('Giá', 'Nhập giá gốc', "price"),
            buildTextField('Giá', 'Nhập khuyến mãi', "promotionalPrice"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    product.storeID = 2;
                    FirebaseAPI().saveProduct(product);
                    Navigator.pop(context);
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
}
