import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class imges extends StatefulWidget {
  const imges({Key? key}) : super(key: key);

  @override
  _imgesState createState() => _imgesState();
}

class _imgesState extends State<imges> {
  late File _image = new File('your initial file');

  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  upload(File imageFile) async {
    var stream =
    new http.ByteStream(imageFile.openRead());

    var length = await imageFile.length();

    var uri = Uri.parse("http://192.168.100.45:1500/add_category?email=info@zinelive.com&password=ZineLive");

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename:(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: GridView(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 46.0),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.7),
                children: <Widget>[
                  Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 87, 0, 0),
                    child: InkWell(
                        onTap: (){
                          getImage();
                        },
                        child: Column(children: [
                          Icon(
                            Icons.add,
                            size: 70,
                          ),
                          Text("الصور", style: TextStyle(fontSize: 20))
                        ])),
                  ),
                  Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 87, 0, 0),
                    child: InkWell(
                        onTap: (){
                          upload(_image);
                        },
                        child: Column(children: [
                          Icon(
                            Icons.add,
                            size: 70,
                          ),
                          Text("رفع منتج", style: TextStyle(fontSize: 20))
                        ])),
                  )
                ])));
  }
}
