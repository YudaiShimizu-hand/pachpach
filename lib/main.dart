import 'package:flutter/material.dart';
import 'package:pachpach/screens/calendar.dart';
import 'package:pachpach/screens/data.dart';
import 'package:pachpach/screens/first.dart';
import 'package:pachpach/screens/login.dart';
import 'package:pachpach/screens/record.dart';
import 'package:pachpach/screens/home.dart';
import 'package:pachpach/screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
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
      initialRoute: '/first',
      routes: {
        '/first' : (context) => FirstPage(),
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

