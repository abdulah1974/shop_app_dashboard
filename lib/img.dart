import 'package:flutter/material.dart';
import 'Dashboard.dart';
class img extends StatefulWidget {
  const img({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
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
                        onTap: (){},
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
                        onTap: (){},
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
