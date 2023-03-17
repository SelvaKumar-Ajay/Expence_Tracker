import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const style = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);
Widget bottomTilesOfGraph(double value, TitleMeta meta) {
  Widget returnText;
  switch (value.toInt()) {
    case 0:
      returnText = const Text(
        "S",
        style: style,
      );
      break;
    case 1:
      returnText = const Text(
        "M",
        style: style,
      );
      break;
    case 2:
      returnText = const Text(
        "T",
        style: style,
      );
      break;
    case 3:
      returnText = const Text(
        "W",
        style: style,
      );
      break;
    case 4:
      returnText = const Text(
        "T",
        style: style,
      );
      break;
    case 5:
      returnText = const Text(
        "F",
        style: style,
      );
      break;
    case 6:
      returnText = const Text(
        "S",
        style: style,
      );
      break;

    default:
      returnText = const Text("");
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: returnText);
}
