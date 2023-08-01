import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCmp(isBtn: 'Calendar'),
    );
  }
}