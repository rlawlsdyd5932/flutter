import 'package:chap05_flutter_todolist/secondDetail.dart';
import 'package:chap05_flutter_todolist/subDetail.dart';
import 'package:chap05_flutter_todolist/thirdPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => Subdetail(),
        '/second': (context) => SecondDetail(),
        '/third': (context) => ThirdDetail(),
      },
    );
  }
}
