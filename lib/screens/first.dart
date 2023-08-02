import 'package:flutter/material.dart';
import 'package:pachpach/constants.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Image.asset(
              KbaseImg,
              width: 300,
              height: 100,
            ),
            KSpace,
            Text('より楽しく、お金を増やそう'),
            SizedBox(
              height: 100,
            ),
            ElevatedButton.icon(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              label: Text('新規登録'),
              icon: const Icon(
                Icons.login,
                color: Color(KbaseColor),
              ),
            ),
            KSecondSpace,
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: Color(KbaseColor),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              label: Text('ログイン', style: TextStyle(color: Colors.black),),
              icon: const Icon(
                Icons.login,
                color: Colors.white,
              ),
            ),
            KSecondSpace,
            ElevatedButton.icon(
              onPressed: (){
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              label: Text('Google', style: TextStyle(color: Colors.black)),
              icon: const Icon(
                Icons.login,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}