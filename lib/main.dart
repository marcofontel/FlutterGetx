import 'package:flutter/material.dart';
import 'package:fluttergetx/value_controller.dart';
import 'package:get/get.dart';

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
            Obx(
              () {
                return Text('Texto: ${valueController.textMain}');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),
            Obx(
              () {
                return valueController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;
                          valueController.setValue(value);
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
