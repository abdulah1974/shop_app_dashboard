import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'img.dart';
import 'imges.dart';
class upload extends StatefulWidget {
  const upload({Key? key}) : super(key: key);

  @override
  _upload createState() => _upload();
}

class _upload extends State<upload> {
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

    var uri = Uri.parse("http://192.168.100.42:3000/single");

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('v', stream, length,
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
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => imges()));
                        },
                        child: Column(children: [
                          Icon(
                            Icons.add,
                            size: 70,
                          ),
                          Text("Upload prodect", style: TextStyle(fontSize: 20))
                        ])),
                  ),
                  Container(
                      color: Colors.black12,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, 87, 0, 0),
                      child: InkWell(
                        onTap: (){},
                        child: Column(children: [
                          Icon(
                            Icons.add,
                            size: 70,
                          ),
                          Text("Upload prodect", style: TextStyle(fontSize: 20))
                        ])),
                      )
                ])));
  }
}


