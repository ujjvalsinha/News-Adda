import 'package:flutter/material.dart';
import 'package:newsfast/DetailedNews.dart';
import 'package:share/share.dart';
//import 'package:url_launcher/url_launcher.dart';

class Nextpage extends StatefulWidget {
  final data1, index;
  Nextpage(this.data1, this.index);
  @override
  _NextpageState createState() => _NextpageState(data1, index);
}

class _NextpageState extends State<Nextpage> {
  notfound() {
    return Container(
      height: 200,
      width: double.infinity,
      child: Image.asset(
        "images/notfound.png",
        fit: BoxFit.cover,
      ),
    );
  }

  String title;
  var data2, index1;
  var text;
  _NextpageState(this.data2, this.index1);

  // launchURL() async {
  //   String url = data2[index1]["url"];
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: data2[index1]["urlToImage"] != null
                        ? Container(
                            height: size.height * .4,
                            width: double.infinity,
                            child: FadeInImage.assetNetwork(
                                              fit: BoxFit.fill,

                                              //fadeInDuration: Duration(seconds: 1),
                                              placeholder: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? "images/lod1.gif"
                                                  : "images/lod2.gif",
                                              image: data2[index1]["urlToImage"],
                                            ),
                          //   Image.network(
                          //     data2[index1]["urlToImage"],
                          //     fit: BoxFit.fill,
                          //   ),
                          )
                        : notfound(),
                  ),
                  Container(
                    height: size.height * .43,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: size.height * .017),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            Share.share(
                                "${data2[index1]["title"]}\n${data2[index1]["url"]}");
                          },
                        );
                        print("tap");
                      },
                      child: CircleAvatar(
                        radius: size.height * .034,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.share,
                          size: size.height * .034,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      color: Colors.black,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: size.height * .04,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                    width: double.infinity,
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          data2[index1]["title"],
                          style: TextStyle(
                              fontSize: 22, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: size.height * .04,
                        margin: EdgeInsets.only(left: 15, right: 2),
                        child: Icon(
                          Icons.calendar_today,
                          size: size.height * .023,
                        ),
                      ),
                      data2[index1]["publishedAt"] != null
                          ? Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                data2[index1]["publishedAt"],
                              ),
                            )
                          : Text("no date")
                    ],
                  ),
                ],
              ),
              data2[index1]["content"] != null
                  ? Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 2),
                      child: Text(
                        "${data2[index1]["content"]} >>>>>> ",
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Color(0xFFB0B0B0)
                              : Color(0xFF808080),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 2),
                      child: Text(""),
                    ),
              FlatButton(
                onPressed: () {
                  print("hello");
                  // launchURL();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailedNews(data2, index1)),
                  );
                },
                child:data2[index1]["content"] != null
                  ? Text(
                  "touch to read more at ${data2[index1]["source"]["name"]}",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFFE0E0E0)
                        : Color(0xFF585858),
                  ),
                ):Text(
                  "Touch to read full article at ${data2[index1]["source"]["name"]}",
                  style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFFE0E0E0)
                        : Color(0xFF585858),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
