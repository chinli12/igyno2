import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<CalendarStruct> getCalendar(
  DateTime firstDayPeriod,
  int periodLength,
  int cycleLength,
  DateTime inputDate,
) {
  // Constants for ovulation and fertile window calculation
  const int ovulationDayOffset = 14;
  const int fertileWindowStartOffset = 10;
  const int fertileWindowEndOffset = 15;

  DateTime startOfMonth = DateTime(inputDate.year, inputDate.month,
      1); // Use inputDate to determine the calendar month
  DateTime endOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Adjust start day to Monday
  DateTime calendarStartDay = startOfMonth;
  if (startOfMonth.weekday != DateTime.monday) {
    calendarStartDay =
        startOfMonth.subtract(Duration(days: startOfMonth.weekday - 1));
  }

  // Adjust end day to Sunday
  DateTime calendarEndDay = endOfMonth;
  if (endOfMonth.weekday != DateTime.sunday) {
    calendarEndDay = endOfMonth.add(Duration(days: 7 - endOfMonth.weekday));
  }

  // Calculate ovulation day and fertile window
  DateTime ovulationDay =
      firstDayPeriod.add(Duration(days: ovulationDayOffset));
  DateTime fertileWindowStart =
      firstDayPeriod.add(Duration(days: fertileWindowStartOffset));
  DateTime fertileWindowEnd =
      firstDayPeriod.add(Duration(days: fertileWindowEndOffset));

  // Calculate the end of the period
  DateTime lastDayPeriod = firstDayPeriod.add(Duration(days: periodLength - 1));

  // Generate the calendar
  List<CalendarStruct> calendar = [];
  DateTime currentDate = calendarStartDay;

  while (currentDate.isBefore(calendarEndDay.add(Duration(days: 1)))) {
    calendar.add(CalendarStruct(
      calendarDay: currentDate,
      isPreviousDay: currentDate.isBefore(startOfMonth),
      isNextMonth: currentDate.isAfter(endOfMonth),
      isInFertileWindow:
          currentDate.isAfter(fertileWindowStart.subtract(Duration(days: 1))) &&
              currentDate.isBefore(fertileWindowEnd.add(Duration(days: 1))),
      isInOvulation: currentDate.isAtSameMomentAs(ovulationDay),
      isInPeriod:
          currentDate.isAfter(firstDayPeriod.subtract(Duration(days: 1))) &&
              currentDate.isBefore(lastDayPeriod.add(Duration(days: 1))),
    ));
    currentDate = currentDate.add(Duration(days: 1));
  }

  return calendar;
}

String predictNextPeriodStart(
  DateTime startPeriod,
  int cycleLength,
) {
  // Calculate the next period's start date by adding the cycle length
  DateTime nextPeriodStart = startPeriod.add(Duration(days: cycleLength));

  // Format the date as "Month Day" (e.g., "June 29")
  return "${DateFormat('MMMM d').format(nextPeriodStart)}";
}

String calculateNextFertileWindow(
  DateTime startPeriod,
  int cycleLength,
) {
  // Calculate ovulation day (14 days before the next period starts)
  DateTime nextOvulationDay = startPeriod.add(Duration(days: cycleLength - 14));

  // Fertile window spans 4 days before ovulation + ovulation day
  DateTime fertileStart = nextOvulationDay.subtract(Duration(days: 4));
  DateTime fertileEnd = nextOvulationDay;

  // Format the dates as "Month Day-Day"
  String fertileWindow =
      "${DateFormat('MMMM d').format(fertileStart)}-${DateFormat('d').format(fertileEnd)}";

  return fertileWindow;
}

String getCyclePhase(
  DateTime startPeriod,
  int cycleLength,
  DateTime currentDate,
  int periodLength,
) {
  currentDate ??= DateTime.now();

  // Calculate the lengths of the phases
  int menstrualPhaseLength = periodLength; // Use the provided period length
  int follicularPhaseLength = cycleLength - periodLength - 14; // Dynamic length
  const int lutealPhaseLength = 14; // Fixed length after ovulation
  const int ovulationLength = 1; // Ovulation lasts one day

  // Define phase boundaries
  DateTime menstrualStart = startPeriod;
  DateTime menstrualEnd =
      startPeriod.add(Duration(days: menstrualPhaseLength - 1));

  DateTime follicularStart = menstrualEnd.add(Duration(days: 1));
  DateTime follicularEnd =
      follicularStart.add(Duration(days: follicularPhaseLength - 1));

  DateTime ovulationStart = follicularEnd.add(Duration(days: 1));
  DateTime ovulationEnd =
      ovulationStart.add(Duration(days: ovulationLength - 1));

  DateTime lutealStart = ovulationEnd.add(Duration(days: 1));
  DateTime lutealEnd = startPeriod.add(Duration(days: cycleLength - 1));

  // Determine the current phase
  if (currentDate.isAtSameMomentAs(menstrualStart) ||
      (currentDate.isAfter(menstrualStart) &&
          currentDate.isBefore(menstrualEnd.add(Duration(days: 1))))) {
    return "Menstrual";
  } else if (currentDate.isAtSameMomentAs(follicularStart) ||
      (currentDate.isAfter(follicularStart) &&
          currentDate.isBefore(follicularEnd.add(Duration(days: 1))))) {
    return "Follicular";
  } else if (currentDate.isAtSameMomentAs(ovulationStart) ||
      (currentDate.isAfter(ovulationStart) &&
          currentDate.isBefore(ovulationEnd.add(Duration(days: 1))))) {
    return "Ovulation";
  } else if (currentDate.isAtSameMomentAs(lutealStart) ||
      (currentDate.isAfter(lutealStart) &&
          currentDate.isBefore(lutealEnd.add(Duration(days: 1))))) {
    return "Luteal";
  }

  return "Unknown Phase";
}

String calculateNextPeriodText(
  DateTime startPeriod,
  int cycleLength,
  DateTime? currentDate,
) {
  currentDate ??= DateTime.now();

  // Calculate the start of the next period
  DateTime nextPeriodStart = startPeriod.add(Duration(days: cycleLength));

  // Determine the difference in days between the current date and the next period
  int daysUntilNextPeriod = nextPeriodStart.difference(currentDate).inDays;

  // Return a human-readable string
  if (daysUntilNextPeriod == 0) {
    return "Today";
  } else if (daysUntilNextPeriod == 1) {
    return "in 1 day";
  } else if (daysUntilNextPeriod > 1) {
    return "in $daysUntilNextPeriod days";
  } else {
    // Handle cases where the current date is after the calculated next period start
    return "Next period has passed. Please update the cycle.";
  }
}

int calculateDaysUntilNextPeriod(
  DateTime startPeriod,
  int cycleLength,
  DateTime? currentDate,
) {
  currentDate ??= DateTime.now();

  // Calculate the difference in days from the start of the last period
  int daysSinceLastPeriod = currentDate.difference(startPeriod).inDays;

  // Determine the current cycle day
  if (daysSinceLastPeriod >= 0 && daysSinceLastPeriod < cycleLength) {
    return daysSinceLastPeriod + 1; // Add 1 to make it 1-based
  }

  // If the current date is outside the cycle, reset to Day 1
  return 1;
}

String calculateOvulationWindow(
  DateTime startPeriod,
  int cycleLength,
  DateTime? currentDate,
) {
  currentDate ??= DateTime.now();

  // Constants for ovulation and fertile window
  const int ovulationDayOffset = 14;
  const int fertileWindowStartOffset = 10;
  const int fertileWindowEndOffset = 15;

  // Calculate the fertile window
  DateTime fertileWindowStart =
      startPeriod.add(Duration(days: fertileWindowStartOffset));
  DateTime fertileWindowEnd =
      startPeriod.add(Duration(days: fertileWindowEndOffset));

  // Calculate days until fertile window starts or ends
  int daysUntilFertileWindowStart =
      fertileWindowStart.difference(currentDate).inDays;
  int daysUntilFertileWindowEnd =
      fertileWindowEnd.difference(currentDate).inDays;

  // Determine the message to return
  if (daysUntilFertileWindowStart > 0) {
    return "Starts in $daysUntilFertileWindowStart days";
  } else if (daysUntilFertileWindowStart <= 0 &&
      daysUntilFertileWindowEnd >= 0) {
    return "Ongoing, ends in ${daysUntilFertileWindowEnd + 1} days";
  } else {
    return "Ovulation window has ended";
  }
}

List<CalendarStruct> getCalendar2(
  DateTime? firstDayPeriod,
  int? periodLength,
  int? cycleLength,
  DateTime inputDate,
) {
  // Constants for ovulation and fertile window calculation
  const int ovulationDayOffset = 14;
  const int fertileWindowStartOffset = 10;
  const int fertileWindowEndOffset = 15;

  DateTime startOfMonth = DateTime(inputDate.year, inputDate.month,
      1); // Use inputDate to determine the calendar month
  DateTime endOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Adjust start day to Monday
  DateTime calendarStartDay = startOfMonth;
  if (startOfMonth.weekday != DateTime.monday) {
    calendarStartDay =
        startOfMonth.subtract(Duration(days: startOfMonth.weekday - 1));
  }

  // Adjust end day to Sunday
  DateTime calendarEndDay = endOfMonth;
  if (endOfMonth.weekday != DateTime.sunday) {
    calendarEndDay = endOfMonth.add(Duration(days: 7 - endOfMonth.weekday));
  }

  // Calculate ovulation day and fertile window
  DateTime ovulationDay =
      firstDayPeriod!.add(Duration(days: ovulationDayOffset));
  DateTime fertileWindowStart =
      firstDayPeriod.add(Duration(days: fertileWindowStartOffset));
  DateTime fertileWindowEnd =
      firstDayPeriod.add(Duration(days: fertileWindowEndOffset));

  // Calculate the end of the period
  DateTime lastDayPeriod =
      firstDayPeriod.add(Duration(days: periodLength! - 1));

  // Generate the calendar
  List<CalendarStruct> calendar = [];
  DateTime currentDate = calendarStartDay;

  while (currentDate.isBefore(calendarEndDay.add(Duration(days: 1)))) {
    calendar.add(CalendarStruct(
      calendarDay: currentDate,
      isPreviousDay: currentDate.isBefore(startOfMonth),
      isNextMonth: currentDate.isAfter(endOfMonth),
      isInFertileWindow:
          currentDate.isAfter(fertileWindowStart.subtract(Duration(days: 1))) &&
              currentDate.isBefore(fertileWindowEnd.add(Duration(days: 1))),
      isInOvulation: currentDate.isAtSameMomentAs(ovulationDay),
      isInPeriod:
          currentDate.isAfter(firstDayPeriod.subtract(Duration(days: 1))) &&
              currentDate.isBefore(lastDayPeriod.add(Duration(days: 1))),
    ));
    currentDate = currentDate.add(Duration(days: 1));
  }

  return calendar;
}

String calculateFertileWindow(
  DateTime startPeriod,
  int cycleLength,
  DateTime? currentDate,
) {
  currentDate ??= DateTime.now();

  // Constants for fertile window
  const int fertileWindowStartOffset = 10;
  const int fertileWindowEndOffset = 15;

  // Calculate the fertile window
  DateTime fertileWindowStart =
      startPeriod.add(Duration(days: fertileWindowStartOffset));
  DateTime fertileWindowEnd =
      startPeriod.add(Duration(days: fertileWindowEndOffset));

  // Calculate days until fertile window starts or ends
  int daysUntilFertileWindowStart =
      fertileWindowStart.difference(currentDate).inDays;
  int daysUntilFertileWindowEnd =
      fertileWindowEnd.difference(currentDate).inDays;

  // Determine the status or free time
  if (daysUntilFertileWindowEnd < 0) {
    return "Free time"; // Fertile window has ended
  } else if (daysUntilFertileWindowStart > 0) {
    return "Starts in $daysUntilFertileWindowStart days";
  } else {
    return "Ongoing, ends in ${daysUntilFertileWindowEnd + 1} days";
  }
}

int analyzeSymptomOccurrencePercentage(
  List<String> userAnaly,
  String? userSymptom,
) {
  // Validate input
  if (userSymptom == null || userSymptom.isEmpty) {
    return 0; // No symptom provided, return 0%
  }

  if (userAnaly.isEmpty) {
    return 0; // No symptoms in the provided list, return 0%
  }

  // Normalize the user symptom to lowercase
  String normalizedUserSymptom = userSymptom.trim().toLowerCase();

  // Normalize the userAnaly symptoms to lowercase for accurate comparison
  List<String> normalizedDatabaseSymptoms =
      userAnaly.map((s) => s.toLowerCase()).toList();

  // Count occurrences of the user-provided symptom
  int symptomOccurrences = normalizedDatabaseSymptoms
      .where((dbSymptom) => dbSymptom == normalizedUserSymptom)
      .length;

  // Calculate the percentage of occurrences
  int percentage = ((symptomOccurrences / userAnaly.length) * 100).toInt();

  return percentage;
}

DateTime getLatmonth(DateTime inputdate) {
  int year = inputdate.year;
  int month = inputdate.month;
  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}

DateTime getNextmonth(DateTime inputdate) {
  int year = inputdate.year;
  int month = inputdate.month;
  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

dynamic jspon(String input) {
  try {
    return json.decode(input);
  } catch (e) {
    print('Error decoding JSON: $e and jsonString: $input');
    return null;
  }
}

String getList(List<String> lis) {
  String result = lis.join(',');
  print(result);
  // write a function that return a list of input
  // Join the list items with commas and return the result
  return result;
}

DateTime formatdate() {
  final DateTime now = DateTime.now();
  final DateTime sixMonthsAgo = now.subtract(const Duration(days: 180));
  DateTime time = sixMonthsAgo;
  return time;
}
