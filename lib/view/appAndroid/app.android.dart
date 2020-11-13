import 'package:delivery/view/appAndroid/intro.android.view.dart';
import 'package:flutter/material.dart';

class AppAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [

        //   ],
        //   child:
        MainAndroid()
        // )
        ;
  }
}

class MainAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Plantão Card",
      // theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   'IntroScreen': (context) => IntroScreen(),
      //   'LoginView': (context) => LoginView(),
      //   'AtualizaDados': (context) => AtualizaDados(),
      //   'HomeView': (context) => HomeView()
      // },
      home: IntroView(),
    );
  }
}
