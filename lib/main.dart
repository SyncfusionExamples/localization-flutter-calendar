import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() => runApp(const LocalizationSupport());

class LocalizationSupport extends StatelessWidget {
  const LocalizationSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('zh'),
        Locale('he'),
        Locale('ru'),
        Locale('fr', 'BE'),
        Locale('fr', 'CA'),
        Locale('ja'),
        Locale('de'),
        Locale('hi'),
        Locale('ar'),
      ],
      locale: Locale('zh'),
      debugShowCheckedModeBanner: false,
      home: CustomStringLocale(),
    );
  }
}

class CustomStringLocale extends StatefulWidget {
  const CustomStringLocale({super.key});

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
          monthViewSettings: const MonthViewSettings(showAgenda: true),
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
    endTime: DateTime.now().add(const Duration(minutes: 10)),
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