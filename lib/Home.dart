
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  late List data;
  late Widget bodey = Center(child: Image.asset("assets/images/loding.gif",height: 200,width: 200,));
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<String> getdata() async {
    var response = await http.get(Uri.parse(
        "http://192.168.100.45:1500/get_categories?email=info@kfc.com&password=kfc"));
    var jsondata = jsonDecode(response.body);
    setState(() {
      data = jsondata;
      bodey = GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 191.6,
              childAspectRatio: 1 / 0.858,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                margin: EdgeInsets.all(5),
                child: Column(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.network("http://10.224.132.255:1500/get_categories_image?path=" + data[index]["logo"])),
                  SizedBox(height: 3.3),
                  Text(data[index]["name"],
                      style: TextStyle(color: Colors.black, fontSize: 15))
                ]));
          });
    });


    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: bodey,backgroundColor: Colors.white,);
  }
}

//
// class _bodey extends StatelessWidget {
//   late List data;
//   _bodey(List Data){
//     this.data = Data;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return data.length>10
//         ?
//         :
//   }
// }