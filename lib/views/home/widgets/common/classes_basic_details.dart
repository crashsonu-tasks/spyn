// All Flutter Built-in Imports Here.
import 'dart:convert';
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:spyn/constants/texts.dart';
import 'package:spyn/utils/helpers.dart';

// All Attributes or Constants Here.

class ClassesBasicDetailsWidget extends StatelessWidget {
  final Map details;

  const ClassesBasicDetailsWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    List<dynamic> jsonList = json.decode(details['days_of_week']);

    List<DayOfWeek> daysOfWeek =
        jsonList.map((json) => DayOfWeek.fromJson(json)).toList();

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(Icons.school, color: Colors.green, size: 30),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                        text: capitalizeEveryWord(details['title']),
                        fontWeight: FontWeight.bold,
                        textSize: 15),
                    AppText(text: details['sport_name']),
                    AppText(
                      text: details['location'],
                    ),
                    AppText(
                      text: convertDaysOfWeekToString(daysOfWeek),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const AppText(
                              text: 'BOOK',
                              textSize: 17,
                              color: Colors.grey,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

String convertDaysOfWeekToString(List<DayOfWeek> daysOfWeek) {
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  List<String> result = [];
  Map<int, List<String>> groupedDays = {};

  // Group days by consecutive days
  for (DayOfWeek day in daysOfWeek) {
    if (groupedDays.containsKey(day.day)) {
      groupedDays[day.day]!
          .add('${formatTime(day.startTime)}-${formatTime(day.endTime)}');
    } else {
      groupedDays[day.day] = [
        '${formatTime(day.startTime)}-${formatTime(day.endTime)}'
      ];
    }
  }

  // Convert grouped days to formatted string
  groupedDays.forEach((key, value) {
    String daysString = value.join(', ');
    if (value.length > 1) {
      daysString = '$daysString';
    }
    result.add('${days[key]} $daysString');
  });

  return result.join(', ');
}

String formatTime(String time) {
  // Extract hours and minutes from the time string
  List<String> parts = time.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  // Format hours in 12-hour format with AM/PM
  String period = hours < 12 ? 'AM' : 'PM';
  if (hours > 12) hours -= 12;

  // Convert hours and minutes to string and format them with leading zeros
  String formattedTime =
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period';

  return formattedTime;
}

class DayOfWeek {
  int day;
  int sctid;
  String endTime;
  String startTime;

  DayOfWeek({
    required this.day,
    required this.sctid,
    required this.endTime,
    required this.startTime,
  });

  factory DayOfWeek.fromJson(Map<String, dynamic> json) {
    return DayOfWeek(
      day: json['day'],
      sctid: json['sctid'],
      endTime: json['end_time'],
      startTime: json['start_time'],
    );
  }
}
