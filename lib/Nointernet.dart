import 'package:flutter/material.dart';

class Nointernet extends StatefulWidget {
  @override
  _NointernetState createState() => _NointernetState();
}

class _NointernetState extends State<Nointernet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: 
          Container(
            color: Color(0xFF12ABFB),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/internet.gif"),
                Text("Whoops !",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text("No internet connection found.",style: TextStyle(fontSize: 18,color: Colors.white,),),
                Text("Check your connection or Try again",style: TextStyle(fontSize: 18,color: Colors.white,),),
              ],
            ),
          ),)
        ],
      ),
      
    );
  }
}