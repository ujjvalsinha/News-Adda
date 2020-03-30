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
            title: Container(
              height: size.height * .05,
              width: size.width * .38,
              child: Image.asset("images/LOGO.png"),
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
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen()),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFG3KaW9Hjl8WGBhuiVqNmzzRZRCFBkgnFom3RCuJ-Zk9DpQNtoA&s",
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
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFG3KaW9Hjl8WGBhuiVqNmzzRZRCFBkgnFom3RCuJ-Zk9DpQNtoA&s"),
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
                                      "NEWS",
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
                              Text("• 2 Min Ago",
                                  style: TextStyle(fontSize: 12))
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
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
