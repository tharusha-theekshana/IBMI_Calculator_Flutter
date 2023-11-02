import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibmi_calculator/pages/main_page.dart';
import 'package:device_preview/device_preview.dart';
import 'dart:developer' as developer;

void main() {
  developer.log("IBMI App Stating");
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.iOS){
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: "IBMI",
        routes: {
          '/': (BuildContext _context) => MainPage(),
        },
        initialRoute: '/',
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: "IBMI",
        routes: {
          '/': (BuildContext _context) => MainPage(),
        },
        initialRoute: '/',
      );
    }
  }
}
