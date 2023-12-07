import 'dart:async';

import 'package:flutter/material.dart';

class StatefulWidgetScreen extends StatefulWidget {
  const StatefulWidgetScreen({super.key});

  @override
  State<StatefulWidgetScreen> createState() => _StatefulWidgetScreenState();
}

class _StatefulWidgetScreenState extends State<StatefulWidgetScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {

      });
    });
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget Screen', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(DateTime.now().hour.toString() + ":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString(), style: TextStyle(fontSize: 50),)),
          Container(
            child: Center(
              child: Text(count.toString(), style: TextStyle(fontSize: 50),),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
