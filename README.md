# How to localize the flutter event calendar?

In flutter event calendar you can change the Locale of the flutter calendar and custom strings using `locale` property of MaterialApp widget.

**Step 1:**
In initState() set the default value for calendar view.
CalendarView _calendarView;

```Dart
@override
void initState() {
  _calendarView = CalendarView.month;
  super.initState();
}
```

**Step 2:**
For localization we need to add the supported locales in an array and using any one of the supported locales we can set the locale for the calendar.
```Dart
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,

      ],
      supportedLocales: [
        const Locale('en'), 
        const Locale('zh'), 
        const Locale('he'), 
        const Locale('ru'), 
        const Locale('fr', 'BE'),
        const Locale('fr', 'CA'),
        const Locale('ja'),
        const Locale('de'),
        const Locale('hi'), 
        const Locale('ar'),
      ],
      locale: const Locale('zh'),
```

**Step 4:**
Please find complete code snippet for custom string localization.

```Dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() => runApp(LocalizationSupport());

class LocalizationSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
        const Locale('he'),
        const Locale('ru'),
        const Locale('fr', 'BE'),
        const Locale('fr', 'CA'),
        const Locale('ja'),
        const Locale('de'),
        const Locale('hi'),
        const Locale('ar'),
      ],
      locale: const Locale('zh'),
      debugShowCheckedModeBanner: false,
      home: CustomStringLocale(),
    );
  }
}

class CustomStringLocale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<CustomStringLocale> {
  CalendarView _calendarView;

  @override
  void initState() {
    _calendarView = CalendarView.month;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SfCalendar(
              view: _calendarView,
              monthViewSettings: MonthViewSettings(showAgenda: true),
              dataSource: _getCalendarDataSource(),
            ),
          ),
        ],
      ),
    ));
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: '会议',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
```
**[View document in Syncfusion Flutter Knowledge base](https://www.syncfusion.com/kb/11246/how-to-localize-the-flutter-event-calendar-sfcalendar)**

**Screenshots**

<img alt="No events text"  src="http://www.syncfusion.com/uploads/user/kb/flut/flut-788/flut-788_img1.jpeg" width="250" height="400" />|
<img alt="Selected date text"  src="http://www.syncfusion.com/uploads/user/kb/flut/flut-788/flut-788_img2.jpeg" width="250" height="400" />|
<img alt="Appointment text"  src="http://www.syncfusion.com/uploads/user/kb/flut/flut-788/flut-788_img3.jpeg" width="250" height="400" />|
