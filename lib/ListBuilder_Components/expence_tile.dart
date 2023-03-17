import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ExpenceListTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTrapped;

  ExpenceListTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.deleteTrapped});

  @override
  Widget build(BuildContext context) => Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          //delete button
          SlidableAction(
            onPressed: deleteTrapped,
            icon: Icons.delete,
          )
        ]),
        child: ListTile(
          title: Text(name),
          subtitle:
              Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
          trailing: Text("Rs : $amount"),
        ),
      );
}
