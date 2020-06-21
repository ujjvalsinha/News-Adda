import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Cateogory extends StatefulWidget {
  final setcategory;
  Cateogory(this.setcategory);
  @override
  _CateogoryState createState() => _CateogoryState(this.setcategory);
}

class _CateogoryState extends State<Cateogory> {
  var setcategory;
  _CateogoryState(this.setcategory);
  spin() {
    return SpinKitRotatingPlain(color: Colors.red);
  }

  var data;
  var url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=2d876e297540454b908c7258890cb059";
  Future getjsondata() async {
    var response = await http.get(url);
    if (mounted) {
      setState(() {
        var convertdata = json.decode(response.body);
        data = convertdata;
        print(data);
      });
    }
  }

  @override
  void initState() {
    // getjsondata();
    super.initState();
  }

  Widget space(img, txt, categoryName) {
    return GestureDetector(
      onTap: () => setcategory(categoryName),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 170,
            width: double.infinity,
            child: Image.asset(
              img,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 140, left: 14),
            height: 70,
            width: MediaQuery.of(context).size.width * 0.99,
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Color(0xFF282828)
              : Colors.white,
              automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            height: size.height * .04,
            width: size.width * .35,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "images/LOGO.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Column(
              children: <Widget>[
                space("images/world.jpeg", "All Current News", ""),
                space("images/bussness.jpeg", "Business", "business"),
                space("images/sports.jpeg", "Sports", "sports"),
                space("images/entertainment.jpeg", "Entertainment",
                    "entertainment"),
                space("images/technology.jpeg", "Technology", "technology"),
                space("images/health.jpeg", "Health", "health"),
              ],
            ),
          ]),
        ),
      ],
    ));
  }
}
