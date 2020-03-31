import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import './Nextpage.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final categoryname;
  Home(this.categoryname);
  @override
  _HomeState createState() => _HomeState(categoryname);
}

class _HomeState extends State<Home> {
  var categoryname;
  _HomeState(this.categoryname);
  String apiLink = 'https://newsapi.org/v2/top-headlines?';
  String cityName = 'country=in';
  String apiKey = 'apiKey=2d876e297540454b908c7258890cb059';
  var data;
  var tittle = "All";

  spin() {
    return SpinKitRotatingPlain(color: Colors.red);
  }

  notfound() {
    return Container(
      height: MediaQuery.of(context).size.height * .29,
      width: double.infinity,
      child: Image.asset("images/notfound.png"),
    );
  }

  Future getjsondata() async {
    var cateogory = this.categoryname.isEmpty ? '' : 'category=$categoryname&';
    var url = '$apiLink$cityName&$cateogory$apiKey';
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (mounted) {
      setState(
        () {
          var convertdata = json.decode(response.body);
          data = convertdata["articles"];
          print(data);
        },
      );
    }
  }

  @override
  void initState() {
    getjsondata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: data == null
          ? spin()
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Color(0xFF282828)
                          : Colors.white,
                  iconTheme: new IconThemeData(
                    color: Colors.red[900],
                  ),
                  title: Row(
                    children: <Widget>[
                      Container(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        // child: Text(tittle,style: TextStyle(color: Colors.red[900],fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  actions: <Widget>[],
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Nextpage(data, index),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xFFA9A9A9),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            height: size.height * .43,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: data[index]["urlToImage"] != null
                                      ? Container(
                                          height: size.height * .29,
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.network(
                                              data[index]["urlToImage"],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                      : notfound(),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(8, 10, 4, 6),
                                  child: Wrap(
                                    children: <Widget>[
                                      data[index]["title"] != null
                                          ? Text(
                                              data[index]["title"],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 3,
                                            )
                                          : notfound(),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 6, 8, 1),
                                      child: Text(
                                        data[index]["source"]["name"],
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 12, top: 6),
                                      child: Text(
                                        data[index]["publishedAt"],
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    childCount: data == null ? 0 : data.length,
                  ),
                ),
              ],
            ),
    );
  }
}
