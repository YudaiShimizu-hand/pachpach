import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarCmp(),
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
                fontSize: 30,
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
            const SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )
                ),
              ),
            ),
            Kspace,
            const Text(
              '機種',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
            ),
            Kspace,
            const Text(
              '投資額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
            ),
            Kspace,
            const Text(
              '回収額(円)',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){}, child: Text('記録する')),
          ],
        ),
        ),
    );
  }
}