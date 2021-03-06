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

  // Future<bool> _onbackpressed() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text("Exit"),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () {
  //             Navigator.pop(context, false);
  //           },
  //           child: Text("No"),
  //         ),
  //         FlatButton(
  //           onPressed: () {
  //             Navigator.pop(context, true);
  //           },
  //           child: Text("Yes"),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: data == null
          ? Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF282828)
                        : Colors.white,
                    child: Theme.of(context).brightness == Brightness.dark
                        ? Image.asset("images/lod1.gif")
                        : Image.asset("images/lod2.gif"),
                  ),
                ),
              ],
            ) //spin()
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
                  //leading: Container(),
                  automaticallyImplyLeading: false,
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
                    (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Nextpage(data, index),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * .45,
                          child: LayoutBuilder(builder: (ctx, constraint) {
                            print("ok: $constraint");
                            return Container(
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
                              child: Column(
                                children: <Widget>[
                                  data[index]["urlToImage"] != null
                                      ? Container(
                                          height: constraint.maxHeight * .64,
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            child: FadeInImage.assetNetwork(
                                              fit: BoxFit.fill,

                                              //fadeInDuration: Duration(seconds: 1),
                                              placeholder: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? "images/lod1.gif"
                                                  : "images/lod2.gif",
                                              image: data[index]["urlToImage"],
                                            ),
                                            //  Image.network(
                                            //   data[index]["urlToImage"],
                                            //   fit: BoxFit.fill,
                                            // ),
                                          ),
                                        )
                                      : notfound(),
                                  Container(
                                    height: constraint.maxHeight * .2,
                                    margin: EdgeInsets.only(
                                      left: constraint.maxWidth * .02,
                                      right: constraint.maxWidth * .02,
                                      top: constraint.maxHeight * .02,
                                      bottom: constraint.maxHeight * .01,
                                    ),
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
                                        padding: EdgeInsets.only(
                                          left: constraint.maxWidth * .02,
                                          right: constraint.maxWidth * .02,
                                           top: constraint.maxHeight * .01,
                                          // bottom: constraint.maxHeight * .02,
                                        ),
                                        child: Text(
                                          data[index]["source"]["name"],
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: constraint.maxWidth * .02,
                                          right: constraint.maxWidth * .02,
                                          top: constraint.maxWidth * .01,
                                          ),
                                        child: Text(
                                          data[index]["publishedAt"],
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        )),
                    childCount: data == null ? 0 : data.length,
                  ),
                ),
              ],
            ),
    );
  }
}
