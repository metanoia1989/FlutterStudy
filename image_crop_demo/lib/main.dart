import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              _image == null 
                ? Text('暂未选择图片')
                : Image.file(_image, width: 300, height: 300),
              FlatButton.icon(
                icon: Icon(Icons.file_upload),
                label: Text('请选择图片'),
                onPressed: () async {
                  File choosedImg = await ImagePicker.pickImage(
                    source: ImageSource.gallery
                  );
                  if(choosedImg != null) {
                    print('选择的图片路径为: ${choosedImg.path}');
                    try {
                      choosedImg = await _cropImage(choosedImg); 
                    } catch (e) {
                      print('裁剪发生错误：${e.toString()}');
                    }
                    setState(() {
                    _image =  choosedImg;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<File> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      ratioX: 1.0,
      ratioY: 1.0,
    );
    return croppedFile;
  }
}
