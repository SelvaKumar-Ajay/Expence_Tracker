import 'package:expencetracker/data/expence_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bar_graph/bargraph.dart';
import '../datetimehelper/datetimehelper.dart';

class ExpenceSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenceSummary({super.key, required this.startOfWeek});

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
      builder: (context, ExpenceDataValue, child) => SizedBox(
        height: 200,
        child: BarGraph(
          maxY: 100,
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
    );
  }
}
