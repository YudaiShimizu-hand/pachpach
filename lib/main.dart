import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black45,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Image.asset(
                'assets/appLogo.png',
              width: 100,
              height: 100,
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.home_filled))
          ],
        ),
      ),
      body: Center(
        child: Column(
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
