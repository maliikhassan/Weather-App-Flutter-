import 'package:flutter/material.dart';
import 'package:weather_app/Activities/home.dart';
import 'package:weather_app/Activities/loading.dart';
import 'package:weather_app/Activities/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Home(),
    title: 'Flutter App',
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (context) => Location(),
      "/loading": (context) => Loading(),
    },
  ));
}
