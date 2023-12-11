import 'package:flutter/material.dart';
import 'package:flutter_working_with_provider/provider/count_provider.dart';
import 'package:flutter_working_with_provider/screen/count_example.dart';
import 'package:flutter_working_with_provider/screen/example_one_screen.dart';
import 'package:provider/provider.dart';

import 'Statefull_widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  /*
  // below is for the count screen.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        // home: StatefulWidgetScreen(),
        home: CountExample(),
      ),
    );
  }
  */
  // below is for the ExampleOne Screen
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ExampleOneScreen(),
      ),
    );
  }
}










