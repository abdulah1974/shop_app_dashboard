import 'dart:convert';

import 'Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bottomNavigationBar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

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
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Key key;

  bool visible = false;

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  Future createAlbum(String username, String peasord) async {
    final response = await http.get(
      Uri.parse('http://192.168.100.45:1500/login_dashbord?email='+username+'&password='+peasord),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );
    if (response.statusCode == 200) {
      if (response.body == "ok") {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => bottomNavigationBar()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("err"),
        ));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
       // mainAxisAlignment: MainAxisAlignment.center,


        children: [
          SizedBox(height: 35,width: 35,),
          Center(
            child:  Text('shop app dashboard',style: TextStyle(color: Colors.red,fontSize: 19,),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 250),
          Container(
            child: Container(
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  autocorrect: true,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type Text Here...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),)
             )),

          Container(
              child: Container(
                  width: 320,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    autocorrect: true,
                    controller: _controller2,
                    decoration: InputDecoration(
                      hintText: 'Type Text Here...',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  )
              )),
            SizedBox(height: 20),

             Container(
               width:250 ,
               height: 60,

               child: Container(
                 child:   RaisedButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(25.00),
                     side: BorderSide(
                       color: Color(0xffd67219),

                     ),
                   ),
                   color: Color(0xffffffff),
                   padding: EdgeInsets.symmetric(
                     vertical: 10,
                     horizontal: MediaQuery.of(context).size.width / 3.5,
                   ),
                   child: Text(
                     'تسجيل',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Color(0xffD67219),
                     ),
                   ),
                   onPressed: () {


                     createAlbum(_controller.text, _controller2.text);

                  //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => bottomNavigationBar()));

                   },
                 ),
               ),
             )

        ]

        ,
      ),
    );
  }
}

