import 'package:flutter/material.dart';

import 'pages/mainpage.dart';


void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTodo',
      home: const MainPage(),
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      // ),
    );
  }

}
