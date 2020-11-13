import 'dart:async';

import 'package:delivery/theme/light.theme.dart';
import 'package:delivery/view/appAndroid/login.android.view.dart';
import 'package:flutter/material.dart';

class IntroView extends StatefulWidget {
  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.jpg",
                  width: constraints.maxHeight * 0.5,
                  height: constraints.maxHeight * 0.4,
                ),
                Text(
                  "DeliverApp!",
                  style: TextStyle(
                    color: textColor,
                    fontSize: constraints.maxHeight * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
