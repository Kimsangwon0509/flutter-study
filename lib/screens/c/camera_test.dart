import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
//import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras;

class MyCamScreen extends StatefulWidget {
  @override
  _MyCamScreenState createState() => _MyCamScreenState();
}

class _MyCamScreenState extends State<MyCamScreen> {
  File imageFile;
  List<int> imageBytes;
  String base64Image;
  Uint8List decoded;

// getting a directory path for saving
  //final String path = await getApplicationDocumentsDirectory().path;
  _imageEncoding() async {
    this.setState(() {});
  }

  _openGallary() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
      imageBytes = imageFile.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      // decoded = base64Decode(base64Image);
      print(base64Image);
      // print(decoded);
    });
  }

  _openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
      imageBytes = imageFile.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      //decoded = base64Decode(base64Image);
      print(base64Image);
      // print(decoded);
    });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Container(
        child: Text('No Image Files!!'),
      );
    } else {
      return Container(
          child: Image.file(
        imageFile,
        width: 400,
        height: 400,
      ));
    }
  }

  Widget _viewBase64() {
    if (base64Image == null) {
      return Container(
        child: Text('There is no ImageFile data!'),
      );
    } else {
      // _imageEncoding();
      return Container(
        child: Text('$base64Image', overflow: TextOverflow.fade),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          '카메라테스트',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.photo,
              color: Colors.black,
            ),
            onPressed: () {
              _openGallary();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.camera,
              color: Colors.black,
            ),
            onPressed: () {
              _openCamera();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _decideImageView(),
                //  _viewBase64(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
