import 'package:flutter/material.dart';
import 'package:fluttergetx/user_controller.dart';
import 'package:fluttergetx/value_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var nameController = TextEditingController();
  var valueController = ValueController();
  final userController = UserController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () {
                    return Text('Texto: ${userController.user.value.name}');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: TextField(
                    controller: nameController,
                  ),
                ),
                Obx(
                  () {
                    return ElevatedButton(
                      onPressed: () {
                        userController.setUserName(nameController.text);
                      },
                      child: const Text('Confirmar'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
