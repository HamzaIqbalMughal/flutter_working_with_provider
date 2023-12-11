import 'package:flutter/material.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {

  double sliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            min: 0,
            max: 1,
            value: sliderValue,
            onChanged: (value) {
              sliderValue = value;
              setState(() {});
            },
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(sliderValue),
                  ),
                  child: const Center(
                    child: Text('Container 1'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(sliderValue),
                  ),
                  child: const Center(
                    child: Text('Container 1'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
