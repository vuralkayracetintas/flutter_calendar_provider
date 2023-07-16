import 'package:demo_apps/provider/event_class.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  Map<DateTime, List<Event>> selectedEvents = {};

  void addEvent(String title, String description, DateTime selectedDate) {
    if (title.isEmpty) {
      return;
    } else {
      if (selectedEvents[selectedDate] != null) {
        selectedEvents[selectedDate]!.add(Event(
          title: title,
          description: description,
          date: selectedDate,
        ));
      } else {
        selectedEvents[selectedDate] = [
          Event(
            title: title,
            description: description,
            date: selectedDate,
          )
        ];
      }
      notifyListeners();
      return;
    }
  }

  List<Event> getEventsByDate(DateTime date) {
    if (selectedEvents.containsKey(date)) {
      return selectedEvents[date]!;
    } else {
      return [];
    }
  }
}
