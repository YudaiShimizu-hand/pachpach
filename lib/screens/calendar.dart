import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {

  // List<Meeting> _getDataSource() {
  //   final List<Meeting> meetings = <Meeting>[];
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime =
  //   DateTime(today.year, today.month, today.day, 9, 0, 0);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //   meetings.add(
  //       Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
  //   return meetings;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCmp(isBtn: 'Calendar'),
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          // dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          )
      ),
    );
  }
}