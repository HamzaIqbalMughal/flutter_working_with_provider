import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);
  ValueNotifier<int> _passwordCharaterCounter = ValueNotifier<int>(0);

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifyListner Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (context, value, child) {
              return TextFormField(
                controller: _passwordController,
                onChanged: (value) {
                  print(value.length);
                  _passwordCharaterCounter.value = value.length;
                },
                obscureText: _toggle.value,
                decoration: InputDecoration(
                  hintText: 'password',
                  suffixIcon: InkWell(
                    onTap: () {
                      _toggle.value = !_toggle.value;
                    },
                    child: Icon(_toggle.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 30),
          ValueListenableBuilder(
              valueListenable: _passwordCharaterCounter,
              builder: (context, value, child){
                return Text(
                  'Charaters entered : '+value.toString(),
                  style: TextStyle(fontSize: 20),
                );
              }
          ),
          SizedBox(height: 200),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, index) {
                return Text(
                  'Floating Button Counter: ' + _counter.value.toString(),
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
