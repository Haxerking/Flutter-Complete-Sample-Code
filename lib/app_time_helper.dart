import 'package:intl/intl.dart';

class ConDateTime {
  String parse({required String dateTime, required String returnFormat}) {
    DateTime dt = DateTime.parse(dateTime)
        .add(const Duration(hours: 5, minutes: 30, seconds: 0));
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }

  
  // String parseAndDelete(
  //     {required String dateTime,
  //     required String dateTime2,
  //     required String returnFormat}) {
  //   DateTime dt = DateTime.parse(dateTime)
  //       .add(const Duration(hours: 5, minutes: 30, seconds: 0));
  //   DateTime dt2 = DateTime.parse(dateTime2)
  //       .add(const Duration(hours: 5, minutes: 30, seconds: 0));
  //   DateFormat dateFormat = DateFormat(returnFormat);
  //   var date = dt.subtract(Duration(days: dt2.day));
  //   String returnDT = dateFormat.format(date);
  //   return returnDT;
  // }

  String parseTime({required String dateTime, required String returnFormat}) {
    DateFormat dtFor = DateFormat("HH:mm:ss");
    DateTime dt = dtFor.parse(dateTime);
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }

  DateTime convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return todayDate;
  }

  String getTimeFromTimeStamp(timeInMillis) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    String formattedDate =
        ConDateTime().parse(dateTime: date.toString(), returnFormat: "hh:mm a");
    return formattedDate;
  }

  String parseTimeStamp(timeInMillis) {
    //int timeInMillis = 1586348737122;
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    String formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }

  String getDateFromTimeStamp({dateTime, returnFormat}) {
    DateTime tempDate = DateFormat("yyyy-mm-dd").parse(dateTime);

    String date = DateFormat(returnFormat).format(tempDate);

    return date;
  }

  String getTimeFromCreationDate({dateTime, returnFormat}) {
    DateTime tempDate = DateFormat("yyyy-mm-dd HH:mm:ss").parse(dateTime);

    String time = DateFormat(returnFormat).format(tempDate);

    return time;
  }
}