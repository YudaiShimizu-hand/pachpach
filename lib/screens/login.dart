import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/components/input.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarCmp(isBtn: 'Record'),
      body: Container(
        margin: const EdgeInsets.all(50),
        width: 300,
        height: 550,
        // color: Color(KbaseColor),
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
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'ログイン',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'メールアドレス',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InputCmp(keyTyp: TextInputType.emailAddress),
            KSpace,
            const Text(
              'パスワード',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InputCmp(keyTyp: TextInputType.text),
            KSecondSpace,
            ButtonCmp(clickHand: (){}, txt: 'ログイン', mt: 5),
          ],
        ),
      ),
    );
  }
}
