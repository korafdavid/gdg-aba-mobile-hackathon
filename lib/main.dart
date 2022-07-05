import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackathon/homepage.dart';
import 'package:hackathon/intro.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const handleInit(),
    );
  }
}

final box = GetStorage();

class handleInit extends StatefulWidget {
  const handleInit({Key? key}) : super(key: key);

  @override
  State<handleInit> createState() => _handleInitState();
}

class _handleInitState extends State<handleInit> {
  @override
  Widget build(BuildContext context) {
    if (box.read('name') != null) {
      return const HomePage();
    } else {
      return const IntroPage();
    }
  }
}

