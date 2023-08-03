import 'package:flutter/material.dart';

class InputCmp extends StatelessWidget {
  InputCmp({required this.keyTyp});
  final TextInputType keyTyp;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 30,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: keyTyp,
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
    );
  }
}