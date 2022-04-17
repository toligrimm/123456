import 'package:flutter/material.dart';

import 'pages/mainpage.dart';


void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FlutterTodo',
      home: MainPage(),
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      // ),
    );
  }

}
