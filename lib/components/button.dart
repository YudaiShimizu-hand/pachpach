import 'package:flutter/material.dart';

class ButtonCmp extends StatelessWidget {
  ButtonCmp({required this.url, required this.txt, required this.mt});
  String url;
  String txt;
  double mt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mt),
      child: ElevatedButton.icon(
        onPressed: (){
          Navigator.pushNamed(context, url);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(200, 50),
          backgroundColor: Colors.black,
        ),
        label: Text(txt),
        icon: const Icon(
          Icons.navigate_next,
          color: Color(0xFF76FF03),
        ),
      ),
    );
  }
}