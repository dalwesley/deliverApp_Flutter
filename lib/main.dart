import 'dart:io';

import 'package:delivery/view/appAndroid/app.android.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    // runApp(IOSApp());
  } else {
    runApp(AppAndroid());
  }
}
