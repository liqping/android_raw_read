import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_raw_read/android_raw_read.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('play'),
            onPressed: (){
              AndroidRawRead().readRawFile('test.txt');
            },
          ),
        ),
      ),
    );
  }
}
