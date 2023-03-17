import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'data/expence_data.dart';
import 'pages/homepage.dart';

void main() async {
  //init hive database
  await Hive.initFlutter();

  //Open hive box
  await Hive.openBox("expenceDB");

  //runAPp should be last or else above codes are will be not work
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenceData(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expence Tracker',
        home: HomePage(),
      ),
    );
  }
}
