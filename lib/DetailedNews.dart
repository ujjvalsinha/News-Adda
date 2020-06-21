import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class DetailedNews extends StatefulWidget {
  final data2, index1;
  DetailedNews(this.data2, this.index1);
  @override
  _DetailedNewsState createState() =>
      _DetailedNewsState(this.data2, this.index1);
}

class _DetailedNewsState extends State<DetailedNews> {
  var data2, index1;
  _DetailedNewsState(this.data2, this.index1);

  @override
  void dispose() {
    FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WebviewScaffold(
      url: data2[index1]["url"],
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Color(0xFF282828),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xFF282828)
            : Colors.white,
        title: Container(
          //color: Colors.redAccent,
          width: size.width * .7,
          child: Text(
            data2[index1]["url"],
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xFF282828),
                fontSize: 18),
          ),
        ),
      ),
      withZoom: false,
      // withLocalStorage: true,
      hidden: true,
    );
  }
}
