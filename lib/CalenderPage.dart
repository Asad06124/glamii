import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Dummy data for different appointment types
  List<DateTime> missedAppointments = [
    DateTime.utc(2024, 11, 10),
    DateTime.utc(2024, 11, 11),
  ];
  Map<DateTime, List<String>> upcomingAppointments = {
    DateTime.utc(2024, 11, 29): ['Consultation with Dr. Smith at 10:00 AM'],
    DateTime.utc(2024, 11, 30): [
      'Follow-up Appointment with Dr. Adams at 2:00 PM',
      'Blood Test with Nurse Emily at 9:30 AM',
    ],
  };
  List<DateTime> canceledAppointments = [
    DateTime.utc(2024, 11, 12),
    DateTime.utc(2024, 11, 13),
  ];
  List<DateTime> previousBookings = [
    DateTime.utc(2024, 11, 5),
    DateTime.utc(2024, 11, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          width: 150,
          // color: Colors.white,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
          ),
        ),
        centerTitle: true,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Appointment Bookings",style: TextStyle(color: Colors.white,fontSize: 30),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLegend('Missed', Colors.red),
                  _buildLegend('Upcoming', Colors.green),
                  _buildLegend('Canceled', Colors.grey),
                  _buildLegend('Previous', Colors.blue),
                ],
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: const TextStyle(color: Colors.white),
                weekendTextStyle: const TextStyle(color: Colors.grey),
                outsideTextStyle: const TextStyle(color: Colors.grey),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (missedAppointments.any((d) => isSameDay(d, day))) {
                    return _buildMarker(day, Colors.red, filled: true);
                  } else if (upcomingAppointments.keys
                      .any((d) => isSameDay(d, day))) {
                    return _buildMarker(day, Colors.green, filled: true);
                  } else if (canceledAppointments.any((d) => isSameDay(d, day))) {
                    return _buildMarker(day, Colors.grey, filled: true);
                  } else if (previousBookings.any((d) => isSameDay(d, day))) {
                    return _buildMarker(day, Colors.blue, filled: true);
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildEventLogs(),
          ],
        ),
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    if (missedAppointments.contains(day)) {
      return ['Missed Appointment'];
    } else if (upcomingAppointments.containsKey(day)) {
      return upcomingAppointments[day]!;
    } else if (canceledAppointments.contains(day)) {
      return ['Canceled Appointment'];
    } else if (previousBookings.contains(day)) {
      return ['Previous Booking'];
    }
    return [];
  }

  Widget _buildLegend(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildMarker(DateTime day, Color color, {bool filled = true}) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: filled ? color : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: color, width: filled ? 0 : 2.0),
      ),
      child: Text(
        '${day.day}',
        style: TextStyle(color: filled ? Colors.white : color),
      ),
    );
  }

  Widget _buildEventLogs() {
    List<String> events = _selectedDay != null ? _getEventsForDay(_selectedDay!) : [];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Events on ${_selectedDay != null ? _selectedDay!.toLocal().toString().split(' ')[0] : 'Selected Date'}:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(height: 8),
          if (events.isNotEmpty)
            ...events.map((event) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                event,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ))
          else
            const Text(
              'No appointments on this day.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
