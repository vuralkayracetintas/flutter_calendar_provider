import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late CleanCalendarController calendarController;
  String selectedDateText = 'No date selected'; 

  @override
  void initState() {
    super.initState();

    calendarController = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      onRangeSelected: (firstDate, secondDate) {
        print('On range selected $firstDate $secondDate');
        updateSelectedDateText('$firstDate - $secondDate');
      },
      onDayTapped: (date) {
        print('On day tapped $date');
        updateSelectedDateText('$date');
      },
      // Diğer controller ayarları...
    );
  }

  void updateSelectedDateText(String newText) {
    setState(() {
      selectedDateText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ScrollableCleanCalendar(
                      locale: 'en',
                      dayRadius: 100,
                      calendarController: calendarController,
                      layout: Layout.BEAUTY,
                      calendarCrossAxisSpacing: 4,
                    ),
                  );
                },
                child: Text('Show Calendar'),
              ),
              SizedBox(height: 16),
              Text('Selected Date: $selectedDateText'),
            ],
          ),
        ),
      ),
    );
  }
}
