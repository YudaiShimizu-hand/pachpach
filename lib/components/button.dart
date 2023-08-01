import 'package:flutter/material.dart';
import 'package:pachpach/constants.dart';
import 'dart:core';

class ButtonCmp extends StatelessWidget {
  ButtonCmp({required this.clickHand, required this.txt, required this.mt});
  String txt;
  double mt;
  final VoidCallback? clickHand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mt),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.white.withOpacity(0.5),
            offset: Offset(15, 15),
          )
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: clickHand,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(200, 50),
          backgroundColor: Colors.black,
        ),
        label: Text(txt),
        icon: const Icon(
          Icons.navigate_next,
          color: Color(KbaseColor),
        ),
      ),
    );
  }
}