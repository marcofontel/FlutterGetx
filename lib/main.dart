import 'package:flutter/material.dart';
import 'package:fluttergetx/value_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var textController = TextEditingController();
  var valueController = ValueController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text(ctrl.textMain);
              },
            ),
            TextField(
              controller: textController,
            ),
            GetBuilder<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return ctrl.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;
                          ctrl.setValue(value);
                        },
                        child: const Text('Confirmar'),
                      );
              },
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
