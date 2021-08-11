import 'package:flutter/material.dart';
import 'package:shop_app_dashboard/Dashboard.dart';
import 'package:shop_app_dashboard/upload.dart';

import 'Home.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _bottomNavigationBar();
  }
}

class _bottomNavigationBar extends State<bottomNavigationBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    upload(),
    dashboard(),

  ];

  List<Color> _colors = [Colors.blue];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (int index) {
          print(index);
          setState(() {
            _selectedIndex = index;


          });
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
            ),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_photo_alternate),
            title: new Text('upload'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.dashboard,
            ),
            title: new Text('dashboard'),
          ),
        ],
      ),
    );
  }
}
