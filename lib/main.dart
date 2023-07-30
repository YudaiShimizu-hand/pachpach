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
        brightness: Brightness.dark,
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
          children: <Widget>[
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 50, left: 10, bottom: 5),
              child: const Text(
                  '記録',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF76FF03),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Card(
                            color: Colors.black54,
                              child: Text(
                                  '総合収支',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                          ),
                          Card(
                            color: Colors.green,
                              child: Text(
                              '月間収支',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                              '+2300000円',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                              '-1400円',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70),
              child: ElevatedButton.icon(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  backgroundColor: Colors.black,
                ),
                label: Text("本日の記録"),
                icon: const Icon(
                    Icons.navigate_next,
                  color: Color(0xFF76FF03),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton.icon(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                  backgroundColor: Colors.black,
                ),
                label: Text("カレンダー"),
                icon: const Icon(
                    Icons.navigate_next,
                  color: Color(0xFF76FF03),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton.icon(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                  backgroundColor: Colors.black,
                ),
                label: Text("データ"),
                icon: const Icon(
                    Icons.navigate_next,
                  color: Color(0xFF76FF03),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
