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
        body: _TestPage(),
      ),
    );
  }
}

class _TestPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State{

  String? _fileString;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            child: const Text('read'),
            onPressed: (){
              AndroidRawRead().readRawFile('test.txt').then((value) {
                if(mounted){
                  setState(() {
                    _fileString = value;
                  });
                }
              });
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text('file content:'),
          if(_fileString != null)
            Text(_fileString!),
        ],
      ),
    );
  }

}
