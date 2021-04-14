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

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(showAgenda: true),
          dataSource: _getCalendarDataSource(),
        ),
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
