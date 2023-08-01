import 'package:flutter/material.dart';
import 'package:pachpach/screens/calendar.dart';
import 'package:pachpach/screens/data.dart';
import 'package:pachpach/screens/login.dart';
import 'package:pachpach/screens/record.dart';
import 'package:pachpach/screens/home.dart';
import 'package:pachpach/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '777',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/record' : (context) => RecordPage(),
        '/data' : (context) => DataPage(),
        '/calendar' : (context) => CalendarPage(),
        '/login' : (context) => LoginPage(),
        '/signin' : (context) => SigninPage(),
      },
    );
  }
}

