import 'package:flutter/material.dart';
import 'package:flutter_working_with_provider/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {

  @override
  Widget build(BuildContext context) {
    print('build');
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
              builder: (context, value, child){
                return Slider(
                  min: 0,
                  max: 1,
                  // value: provider.sliderValue,
                  value: value.sliderValue,
                  onChanged: (val) {
                    // provider.setSliderValue(value);
                    value.setSliderValue(val);
                  },
                );
              }
          ),
          Consumer<ExampleOneProvider>(builder: (context, value, child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.sliderValue),
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
                      color: Colors.red.withOpacity(value.sliderValue),
                    ),
                    child: const Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
