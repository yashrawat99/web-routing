import 'package:flutter/material.dart';
import 'package:project01/pages/Choose_Location.dart';
import 'package:project01/pages/Home.dart';
import 'package:project01/pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const HomeComponent(),
      '/location': (context) => const Choose_Location(),
    },
  ));
}
