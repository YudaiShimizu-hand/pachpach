import 'package:flutter/material.dart';
import 'package:pachpach/components/appBar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pachpach/services/riverPod/setProvider.dart';

class EventData {
  final String place;
  final String shop;
  final String machine;
  final String score;
  final DateTime date;

  EventData({required this.place, required this.shop, required this.machine, required this.score, required this.date});
}


class CalendarPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final eventsAsyncValue = watch(eventDataProvider);

    return Scaffold(
      appBar: AppBarCmp(isBtn: 'Calendar'),
      body: eventsAsyncValue.when(
        data: (events) {
          return SfCalendar(
            view: CalendarView.month,
            dataSource: EventDataSource(events),
            monthViewSettings: MonthViewSettings(
              appointmentDisplayCount: 5,
            ),
            onTap: (CalendarTapDetails details) {
              if (details.appointments != null &&
                  details.appointments!.isNotEmpty) {
                _showEventsList(context, details.appointments!);
              }
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventData> events) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final event = appointments![index] as EventData;
    return event.date;
  }

  @override
  DateTime getEndTime(int index) {
    final event = appointments![index] as EventData;
    return event.date;
  }

  @override
  String getSubject(int index) {
    final event = appointments![index] as EventData;
    return "${event.place} at ${event.shop} at ${event.machine} at ${event.score}";
  }
}

// イベント詳細を表示するためのダイアログを表示する関数
void _showEventDetails(BuildContext context, EventData event) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('場所'),
            subtitle: Text(event.place),
          ),
          ListTile(
            title: Text('店舗'),
            subtitle: Text(event.shop),
          ),
          ListTile(
            title: Text('機種'),
            subtitle: Text(event.machine),
          ),
          ListTile(
            title: Text('結果'),
            subtitle: Text(event.score),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    ),
  );
}

void _showEventsList(BuildContext context, List<dynamic> appointments) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Daily Data'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final EventData event = appointments[index] as EventData;
            return ListTile(
              title: Text(event.place),
              onTap: () {
                Navigator.pop(context); // Close the list dialog
                _showEventDetails(context, event); // Then show event details
              },
            );
          },
        ),
      ),
    ),
  );
}