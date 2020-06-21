import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsfast/Nointernet.dart';
import './Cateogory.dart';
import './Home.dart';
import './Profile.dart';
import './Video.dart';

main() {
  runApp(
    DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primaryColor: Colors.white,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: new MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  String _cateogory = "";
  StreamSubscription connectivitySubscription;
  ConnectivityResult oldres;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resnow) {
      if (resnow == ConnectivityResult.none) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Nointernet(),
          ),
        );
      } else if (oldres == ConnectivityResult.none) {
        print("connected");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
        );
      }

      oldres = resnow;
    });
    super.initState();
  }

  void setCateogory(String cateogoryName) {
    setState(
      () {
        _cateogory = cateogoryName;
        currentIndex = 0;
      },
    );
    print(_cateogory);
  }

  _body() {
    switch (currentIndex) {
      case 0:
        return Home(_cateogory);
      case 1:
        return Cateogory(setCateogory);
      case 2:
        return Video();
      case 3:
        return Profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              'Category',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library,
            ),
            title: Text(
              'Video',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
            ),
            title: Text(
              "Accounts",
            ),
          ),
        ],
      ),
    );
  }
}
