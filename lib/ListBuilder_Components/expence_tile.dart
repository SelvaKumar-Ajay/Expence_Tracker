import 'package:flutter/material.dart';

class ExpenceListTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;

  const ExpenceListTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(name),
        subtitle:
            Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
        trailing: Text("Rs : $amount"),
      );
}
