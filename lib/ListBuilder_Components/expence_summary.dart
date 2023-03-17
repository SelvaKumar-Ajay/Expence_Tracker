import 'package:expencetracker/data/expence_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bar_graph/bargraph.dart';
import '../datetimehelper/datetimehelper.dart';

class ExpenceSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenceSummary({super.key, required this.startOfWeek});

  //calculate max value
  double calculateMax(
    ExpenceData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double max = 100;

    List<double> values = [
      value.calculateDailyExpenceSummary()[sunday] ?? 0,
      value.calculateDailyExpenceSummary()[monday] ?? 0,
      value.calculateDailyExpenceSummary()[tuesday] ?? 0,
      value.calculateDailyExpenceSummary()[wednesday] ?? 0,
      value.calculateDailyExpenceSummary()[thursday] ?? 0,
      value.calculateDailyExpenceSummary()[friday] ?? 0,
      value.calculateDailyExpenceSummary()[saturday] ?? 0,
    ];

    // sort list values
    values.sort();
    //get last largest amount

    //  Increase the chart bar slightly full so it does not look like full
    max = values.last * 1.1;

    return max == 0 ? 100 : max;
  }

  //calculate week total
  String calculateWeekTotal(
    ExpenceData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpenceSummary()[sunday] ?? 0,
      value.calculateDailyExpenceSummary()[monday] ?? 0,
      value.calculateDailyExpenceSummary()[tuesday] ?? 0,
      value.calculateDailyExpenceSummary()[wednesday] ?? 0,
      value.calculateDailyExpenceSummary()[thursday] ?? 0,
      value.calculateDailyExpenceSummary()[friday] ?? 0,
      value.calculateDailyExpenceSummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    //Get each date of this week
    final sunday =
        convertDatetoString(startOfWeek.add(const Duration(days: 0)));
    final monday =
        convertDatetoString(startOfWeek.add(const Duration(days: 1)));
    final tuesday =
        convertDatetoString(startOfWeek.add(const Duration(days: 2)));
    final wednesday =
        convertDatetoString(startOfWeek.add(const Duration(days: 3)));
    final thursday =
        convertDatetoString(startOfWeek.add(const Duration(days: 4)));
    final friday =
        convertDatetoString(startOfWeek.add(const Duration(days: 5)));
    final saturday =
        convertDatetoString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenceData>(
      // ignore: non_constant_identifier_names
      builder: (context, ExpenceDataValue, child) => Column(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              const Text(
                "Week Total : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                  "₹ ${calculateWeekTotal(ExpenceDataValue, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}"),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: BarGraph(
            maxY: calculateMax(ExpenceDataValue, sunday, monday, tuesday,
                wednesday, thursday, friday, saturday),
            sunAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[sunday] ?? 0,
            monAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[monday] ?? 0,
            tueAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[tuesday] ?? 0,
            wedAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[wednesday] ?? 0,
            thuAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[thursday] ?? 0,
            friAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[friday] ?? 0,
            satAmount:
                ExpenceDataValue.calculateDailyExpenceSummary()[saturday] ?? 0,
          ),
        ),
      ]),
    );
  }
}
