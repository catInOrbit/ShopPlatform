import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/categoryProduct.dart';
import 'package:ExpShop/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class EditProductPage extends StatefulWidget {
  final String urlEditProductPage = "/EditProductPage";
  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  ProductItem _productItem = new ProductItem();
  String docID;
  DateTime _dateTime = DateTime.now();
  String status = '';
  String error = 'Error';
  String _uploadedFileURL;
  File _image;
  CategoryProduct categoryProduct;

  TextEditingController _productNameEditingController =
      new TextEditingController();
  TextEditingController _productPriceEditingController =
      new TextEditingController();
  TextEditingController _productPromotionalPriceEditingController =
      new TextEditingController();

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
        _productItem.image = _uploadedFileURL;
      });
    });
  }

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
          _productItem.categoryID = categoryProduct.categoryID;
          print(_productItem.categoryID);
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

  buildTextField(
      String labelText, String placeholder, String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        initialValue: value,
        onChanged: (text) {
          setState(() {
            if (name == "productName") {
              _productItem.productName = text;
              print(_productItem.productName);
            } else if (name == "price") {
              _productItem.price = double.parse(text);
            } else if (name == "promotionalPrice") {
              _productItem.promotionalPrice = int.parse(text);
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    this._productItem = arguments["productItem"];
    this.docID = arguments["docID"];
    _productNameEditingController.text = _productItem.productName;

    listCategory.forEach((element) {
      if (element.categoryID == _productItem.categoryID) {
        categoryProduct = element;
      }
    });
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
            buildTextField('Tên Sản Phẩm', 'Nhập tên sản phẩm', "productName",
                _productItem.productName),
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
                                initialDate: _productItem.expirationDate,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2050))
                            .then((value) {
                          setState(() {
                            _productItem.expirationDate = value;
                          });
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format(_productItem.expirationDate),
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
                                child: Image.asset(
                                  _image.path,
                                  fit: BoxFit.fill,
                                ),
                                height: 300,
                                width: 300,
                              )
                            : Container(
                                child: Image.network(
                                  '${_productItem.image}',
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
            buildTextField(
                'Giá', 'Nhập giá gốc', "price", _productItem.price.toString()),
            buildTextField('Giá', 'Nhập khuyến mãi', "promotionalPrice",
                _productItem.promotionalPrice.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Hủy bỏ",
                    style: TextStyle(
                        fontSize: 18, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    FirebaseAPI().updateProductsItem(_productItem, docID);
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Cập nhật",
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
