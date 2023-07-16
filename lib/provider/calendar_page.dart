import 'package:demo_apps/provider/event_class.dart';
import 'package:demo_apps/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Map<DateTime, List<Event>> selectedEvents;

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _firstDay = DateTime.utc(2020, 1, 1);
  DateTime _focusedDate = DateTime.now();
  final DateTime _lastDay = DateTime(DateTime.now().year + 5);
  DateTime _selectedDate = DateTime.now();
  String formatDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.sizeOf(context).height;
    double mWidth = MediaQuery.sizeOf(context).width;
    final eventProvider = Provider.of<EventProvider>(context);
    final filteredEvents = eventProvider.getEventsByDate(_selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Takvim'),
      ),
      body: Column(
        children: [
          TableCalendar(
            rowHeight: mWidth * 0.1,
            focusedDay: _focusedDate,
            firstDay: _firstDay,
            lastDay: _lastDay,
            headerStyle: const HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
            ),
            calendarStyle: const CalendarStyle(),

            startingDayOfWeek: StartingDayOfWeek.monday,
            availableGestures: AvailableGestures.all,
            eventLoader: _getEventsfromDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (CalendarFormat format) {
              setState(() {
                format = format;
              });
            },
            daysOfWeekVisible: true,

            //Day Changed
            selectedDayPredicate: (DateTime date) {
              return isSameDay(_selectedDate, date);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
                _focusedDate = focusedDay;
              });
            },
            // rangeStartDay: selectedDate,
            // rangeEndDay: today,

            // eventLoader: (day) => [],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: mHeight * 0.3,
              width: mWidth * 0.8,
              decoration: ShapeDecoration(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 0.50,
                    color: Color(0xFF37352F),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        Text('$formatDate - Yapılacaklar'),
                        Text(
                          'Seçilen Gün: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                        ),
                      ]),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredEvents.length,
                      itemBuilder: (context, index) {
                        Event event = filteredEvents[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 0.50,
                                  color: Color(0xFF37352F),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: ListTile(
                              leading: IconButton(
                                icon: const Icon(Icons.check),
                                onPressed: () {},
                              ),
                              title: Text(event.title),
                              subtitle: Text(event.description),
                              trailing: IconButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: AlertDialog(
                                        title: Text(event.title),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: [
                                              Text(event.description),
                                              const Text(
                                                  // '${time.hour}:${time.minute}',
                                                  'demo'),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // AlertDialog kapatmak için yapılacak işlemler
                                              setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Tamam"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Etkinlik Ekle'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Başlık',
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Açıklama',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('İptal'),
                  ),
                  TextButton(
                    onPressed: () {
                      String title = _titleController.text;
                      String description = _descriptionController.text;
                      DateTime selectedDate = _selectedDate;

                      if (title.isNotEmpty) {
                        Event event = Event(
                          title: title,
                          description: description,
                          date: selectedDate,
                        );

                        if (selectedEvents.containsKey(selectedDate)) {
                          selectedEvents[selectedDate]!.add(event);
                        } else {
                          selectedEvents[selectedDate] = [event];
                        }
                      }

                      _titleController.clear();
                      _descriptionController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Ekle'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
