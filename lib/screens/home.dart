import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCmp(),
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
                onPressed: (){
                  Navigator.pushNamed(context, '/record');
                },
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
                onPressed: (){
                  Navigator.pushNamed(context, '/calendar');
                },
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
                onPressed: (){
                  Navigator.pushNamed(context, '/data');
                },
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
