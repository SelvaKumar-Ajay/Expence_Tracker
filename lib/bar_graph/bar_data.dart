import 'package:expencetracker/bar_graph/indivitual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  BarData(
      {required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thuAmount,
      required this.friAmount,
      required this.satAmount});

  List<IndivitualBar> barData = [];

  //Initialize bar data
  void initialiseBarData() {
    barData = [
      IndivitualBar(0, sunAmount),
      IndivitualBar(1, monAmount),
      IndivitualBar(2, tueAmount),
      IndivitualBar(3, wedAmount),
      IndivitualBar(4, thuAmount),
      IndivitualBar(5, friAmount),
      IndivitualBar(6, satAmount),
    ];
  }
}
