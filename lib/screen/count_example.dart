import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_working_with_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // now if i set listen=true, that means it is listening whereas this now the widget is not build yet. so we are getting error,
    // now we have to set listen=false,
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // where ever we create the object of Provider it starts listening to changes and build the whole widget in which it is created.
    // like in the above case countProvider is initialized with Provider, now whenever any changes happens it will rebuild the Widget build()
    // but we don't want to rebuild the whole widget, we only want to rebuild the widget where changes are actually happened,
    // - Provider.of<CountProvider>(context, listen: false); // so setting the listen = false, will stop it to listen the changes
    // & now will only rebuild the Consumer widget with its provider e.g :- Consumer<CountProvider>(builder: (context, value, child){}
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child){
          return Text(
            countProvider.count.toString(),
            style:  TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
