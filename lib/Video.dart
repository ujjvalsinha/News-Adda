import 'package:flutter/material.dart';
import './VideoPlayerScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  spin() {
    return SpinKitRotatingPlain(color: Colors.red);
  }

  List<String> image = [
    "images/tv1.jpeg",
    "images/tv2.jpg",
    "images/tv3.jpg",
    "images/tv4.jpeg",
    "images/tv5.jpg"
  ];

  List<String> text = [
    "Aaj tak",
    "ABP",
    "India Today",
    "INDIA TV",
    "TV9",
  ];

  List<String> link = [
    "https://www.youtube.com/watch?v=QZmAYF3uYag",
    "https://www.youtube.com/watch?v=z7cQ1GTfLUY",
    "https://www.youtube.com/watch?v=uQlwJ8ckz8s",
    "https://www.youtube.com/watch?v=nFBTh57oFsI",
    "https://www.youtube.com/watch?v=ZB_cxKau8iQ",
  ];

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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(link, index),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          image[index],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 13, bottom: 20),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            image[index],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.77,
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Wrap(
                                  children: <Widget>[
                                    Text(
                                      text[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "TOP NEWS",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Icon(Icons.more_vert))
                    ],
                  ),
                ],
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
