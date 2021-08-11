import 'package:flutter/widgets.dart';

import 'Dashboard.dart';
import 'package:flutter/material.dart';

import 'described.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [


          Center(

            child: Text(
              'shop app dashboard',
              style: TextStyle(color: Colors.red, fontSize: 19, height: 4),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,


              children: List.generate(100, (index) {

                return Card(


                  shape: RoundedRectangleBorder(

                    side: BorderSide(color: Colors.deepOrange, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),


                  child: Column(



                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => described()));

                        },
                        child: Column(
                          children: [

                            Image.network('https://picsum.photos/500/500?random=$index',width: 150, height: 150,),
                            Text(
                              'Text $index',
                              style: TextStyle(fontSize: 15),

                            ),
                          ],
                        ),
                      ),



//                       Container(
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(30.0),
//                               bottomLeft: Radius.circular(30.0),
//                             ),
//                             image: const DecorationImage(
//                               image: Image.network(
// 'https://picsum.photos/500/500?random=$index')
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         child: Image.network(
//                           'https://picsum.photos/500/500?random=$index',
//                           width: 150,
//                           height: 150,
//                         )
//                       ),






                    ],

                  ),


                );
              }),


            ),
          ),
        ],
      ),
    );
  }
}
