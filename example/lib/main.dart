import 'package:flutter/material.dart';
import 'package:flutter_keyboard_done/flutter_keyboard_done.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterKeyboardDoneWidget(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Plugin example app'),
          ),
          body: const Center(
            child: TextField(),
          ),
        ),
      ),
    );
  }
}
