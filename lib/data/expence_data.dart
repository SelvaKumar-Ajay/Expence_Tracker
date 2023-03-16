import 'package:expencetracker/model/expence_item.dart';
import 'package:flutter/cupertino.dart';
import '../datetimehelper/datetimehelper.dart';

class ExpenceData extends ChangeNotifier {
  //List of All expences
  List<ExpenceItem> overallExpenceList = [];

  //get expence List
  List<ExpenceItem> getAllExpenceList() {
    return overallExpenceList;
  }

  //add New Expence
  void addNewExpence(ExpenceItem newExpenceItem) {
    overallExpenceList.add(newExpenceItem);

    notifyListeners();
  }

  //delete Expence
  void deleteExpence(ExpenceItem deleteExpence) {
    overallExpenceList.remove(deleteExpence);

    notifyListeners();
  }

  // Get Weekday from datetime
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thurs';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return "";
    }
  }

  //get the date for Start of the Week(means Sunday)

  DateTime getStartDayofWeek() {
    DateTime? startofWeek;

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startofWeek = today.subtract(Duration(days: i));
      }
    }
    return startofWeek!;
  }

  //Calculate dailyExpence Summary for week chart view

  Map<String, double> calculateDailyExpenceSummary() {
    Map<String, double> dailyExpenceSummary = {};

    for (var expence in overallExpenceList) {
      String date = convertDatetoString(expence.dateTime);
      double amount = double.parse(expence.amount);

      if (dailyExpenceSummary.containsKey(date)) {
        double currentAmount = dailyExpenceSummary[date]!;
        currentAmount += amount;
        dailyExpenceSummary[date] = currentAmount;
      } else {
        dailyExpenceSummary.addAll({date: amount});
      }
    }
    return dailyExpenceSummary;
  }
}
