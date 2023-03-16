import 'package:expencetracker/ListBuilder_Components/expence_summary.dart';
import 'package:expencetracker/data/expence_data.dart';
import 'package:expencetracker/model/expence_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ListBuilder_Components/expence_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TextControllers
  final TextEditingController addNewExpenceNameController =
      TextEditingController();
  final TextEditingController addNewExpenceAmountController =
      TextEditingController();

//Addnewexpence floating button onpress function
  void addNewExpence() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add New Expence'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: addNewExpenceNameController),
                TextField(controller: addNewExpenceAmountController),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: cancel,
                child: const Text("Cancel"),
              ),
              MaterialButton(
                onPressed: save,
                child: const Text("Save"),
              ),
            ],
          );
        });
  }

  //addNewexpence function cancel button onpress function
  void cancel() {
    Navigator.pop(context);

    addNewExpenceAmountController.clear();
    addNewExpenceNameController.clear();
  }

//addNewexpence function save button onpress function
  void save() {
    ExpenceItem newExpence = ExpenceItem(
        name: addNewExpenceNameController.text,
        amount: addNewExpenceAmountController.text,
        dateTime: DateTime.now());
    Provider.of<ExpenceData>(context, listen: false).addNewExpence(newExpence);
    Navigator.pop(context);
    addNewExpenceAmountController.clear();
    addNewExpenceNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenceData>(
      // ignore: non_constant_identifier_names
      builder: (context, ExpenceDataValue, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: addNewExpence,
          child: const Icon(Icons.add_card_rounded),
        ),
        body: SafeArea(
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            ExpenceSummary(startOfWeek: ExpenceDataValue.getStartDayofWeek()),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ExpenceDataValue.getAllExpenceList().length,
              itemBuilder: (context, i) => ExpenceListTile(
                amount: ExpenceDataValue.getAllExpenceList()[i].amount,
                dateTime: ExpenceDataValue.getAllExpenceList()[i].dateTime,
                name: ExpenceDataValue.getAllExpenceList()[i].name,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
