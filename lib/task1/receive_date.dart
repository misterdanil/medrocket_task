import 'package:flutter/material.dart';
import 'package:medrocket_task/task1/exceptions/invalid_month_exception.dart';
import 'package:medrocket_task/task1/exceptions/invalid_weekday_exception.dart';
import 'package:medrocket_task/task1/task1_colors.dart';
import 'package:medrocket_task/task1/task1_constants.dart';

class ReceiveDate extends StatelessWidget {
  final DateTime dateTimeReceive;

  ReceiveDate(this.dateTimeReceive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, color: Task1Colors.icon),
        const SizedBox(width: Task1Constants.iconTextMargin),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$_day $_month ($_dayOfWeek), $_time",
              style: const TextStyle(fontSize: Task1Constants.payloadFontSize),
            ),
            const Text(
              "Дата получения документа",
              style: TextStyle(
                color: Task1Colors.metadata,
                fontSize: Task1Constants.metadataPayloadFontSize,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int get _day {
    return dateTimeReceive.day;
  }

  String get _month {
    int month = dateTimeReceive.month;
    switch (month) {
      case (1):
        return "января";
      case (2):
        return "февраля";
      case (3):
        return "марта";
      case (4):
        return "апреля";
      case (5):
        return "мая";
      case (6):
        return "июня";
      case (7):
        return "июля";
      case (8):
        return "августа";
      case (9):
        return "сентября";
      case (10):
        return "октября";
      case (11):
        return "ноября";
      case (12):
        return "декабря";
      default:
        throw InvalidMonthException(month);
    }
  }

  String get _dayOfWeek {
    int weekday = dateTimeReceive.weekday;
    switch (weekday) {
      case (1):
        return "пн";
      case (2):
        return "вт";
      case (3):
        return "ср";
      case (4):
        return "чт";
      case (5):
        return "пт";
      case (6):
        return "сб";
      case (7):
        return "вс";
      default:
        throw InvalidWeekdayException(weekday);
    }
  }

  String get _time {
    int hour = dateTimeReceive.hour;
    int minute = dateTimeReceive.minute;

    return "${_getTwoDigitTime(hour)}:${_getTwoDigitTime(minute)}";
  }

  String _getTwoDigitTime(int value) {
    return value <= 9 ? "0$value" : "$value";
  }
}
