// import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../model/expence_item.dart';

class HiveDataBase {
  //reference hive open box thar defined in main file
  final myBox = Hive.box("expenceDB");

//save data
  void saveData(List<ExpenceItem> allExpences) {
// In hive we can only store basic primitive datatypes,like String,int,dateTime and not custom objects like ExpenceItem
//So here we gonna convert this custom object to basic primitive types so we can store it in our db.

    List<List<dynamic>> allExpenceFormatted = [];

    for (var expence in allExpences) {
      //Convert each allexpences expenceItem to a Storable type
      List<dynamic> expenceFormatted = [
        expence.name,
        expence.amount,
        expence.dateTime
      ];
      allExpenceFormatted.add(expenceFormatted);
    }

    //Store allexpenceFormmated list to in our db
    myBox.put("ALL_EXPENCES", allExpenceFormatted);
  }

  // read data
  List<ExpenceItem> readData() {
    List savedExpences = myBox.get("ALL_EXPENCES") ?? [];
    List<ExpenceItem> allExpences = [];
    //retrive the saved data above and convert it to the normal ExpenceItem object list for to display in app
    //Collect each indivitual Expencedata
    for (var expence in savedExpences) {
      String name = expence[0];
      String amount = expence[1];
      DateTime dateTime = expence[2];
      //Create ExpenceItem
      ExpenceItem expenceValue =
          ExpenceItem(name: name, amount: amount, dateTime: dateTime);

      //add ExpenceValue to Overall List of allExpences
      allExpences.add(expenceValue);
    }
    //Return allExpence
    return allExpences;
  }
}
