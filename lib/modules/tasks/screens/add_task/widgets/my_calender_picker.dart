import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:taskify/resources/colors.dart';

class MyCalenderPicker extends StatefulWidget {
  const MyCalenderPicker({super.key});

  @override
  State<MyCalenderPicker> createState() => _MyCalenderPickerState();
}

class _MyCalenderPickerState extends State<MyCalenderPicker> {
  @override
  Widget build(BuildContext context) {
    return HorizontalCalendar(
      date: DateTime.now(),
      textColor: Colors.black45,
      backgroundColor: Colors.white,
      selectedColor: kPrimaryColor,
      showMonth: true,
      onDateSelected: (date) {
        print(date.toString());
      },
    );
  }
}
