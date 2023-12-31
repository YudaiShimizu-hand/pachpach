import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/services/riverPod/setProvider.dart';
import 'package:pachpach/services/totalData.dart';
import 'package:pachpach/services/monthTotalData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    initFirebaseToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCmp(isBtn: 'Home'),
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
                color: Color(KbaseColor),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.0,
                    color: Color(KbaseColor).withOpacity(0.5),
                    offset: Offset(20, 20),
                  )
                ],
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
                        children: <Widget>[
                          TotalDataWidget(),
                          MonthTotalDataWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonCmp(clickHand:  (){
              Navigator.pushNamed(context, '/record');
            },txt: '本日の記録', mt: 70),
            ButtonCmp(clickHand: (){
              Navigator.pushNamed(context, '/calendar');
            }, txt: 'カレンダー', mt: 30),
            ButtonCmp(clickHand: (){
              Navigator.pushNamed(context, '/data');
            }, txt: 'データ', mt: 30),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

