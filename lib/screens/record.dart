import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:pachpach/components/input.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
              height: 30,
            ),
            const Text(
              '本日の記録',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Kspace,
            const Text(
                  '場所',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
            ),
            InputCmp(keyTyp: TextInputType.text),
            Kspace,
            const Text(
              '機種',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InputCmp(keyTyp: TextInputType.text),
            Kspace,
            const Text(
              '投資額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InputCmp(keyTyp: TextInputType.number),
            Kspace,
            const Text(
              '回収額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            InputCmp(keyTyp: TextInputType.number),
            const SizedBox(
              height: 30,
            ),
            ButtonCmp(clickHand: (){}, txt: '記録する', mt: 5),
          ],
        ),
        ),
    );
  }
}
