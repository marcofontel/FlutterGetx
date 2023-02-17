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
  var ageController = TextEditingController();

  var valueController = ValueController();
  final userController = UserController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(
                () {
                  return Text('Nome: ${userController.user.value.name}');
                },
              ),
              Obx(
                () {
                  return Text('Idade: ${userController.user.value.age}');
                },
              ),
              const Divider(
                thickness: 1.5,
                color: Colors.blue,
              ),

              // Nome
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(label: Text('Nome')),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userController.setUserName(nameController.text);
                    },
                    child: const Text('salvar'),
                  ),
                ],
              ),

              // Idade
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Idade'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userController.setUserAge(int.parse(ageController.text));
                    },
                    child: const Text('salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
