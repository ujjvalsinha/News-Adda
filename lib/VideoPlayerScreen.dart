import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class VideoPlayerScreen extends StatefulWidget {
  final link, index;
  VideoPlayerScreen(this.link, this.index);
  @override
  _VideoPlayerScreenState createState() =>
      _VideoPlayerScreenState(this.link, this.index);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final link, index;
  _VideoPlayerScreenState(this.link, this.index);

  void initState() {
    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.initState();
  }

  @override
  void dispose() {
    FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.dispose();
    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.landscapeRight,
      //DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WebviewScaffold(
      url: link[index],
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(size.height * .00),
        child: new AppBar(
           
      //     leading: GestureDetector(
      //       onTap: () => Navigator.pop(context),
      //       child: Icon(
      //         Icons.close,
      //         size: 12,
      //         color: Colors.white,
      //       ),
      //     ),
      //     // iconTheme: IconThemeData(
      //     //   color: Theme.of(context).brightness == Brightness.dark
      //     //       ? Colors.white
      //     //       : Color(0xFF282828),
      //     // ),
      //     backgroundColor: Colors.black,
      //     title: Container(
      //       //color: Colors.redAccent,
      //       width: size.width * .7,
      //       child: Text(
      //         "Live",
      //         overflow: TextOverflow.fade,
      //         style: TextStyle(
      //             color:  Colors.white,
                     
      //             fontSize: 12),
      //       ),
      //     ),
         ),
      ),
      withZoom: false,

      // withLocalStorage: true,
      hidden: true,
    );
  }
}
