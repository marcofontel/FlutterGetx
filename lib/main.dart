import 'package:flutter/material.dart';
import 'package:fluttergetx/user_controller.dart';
import 'package:fluttergetx/value_controller.dart';
import 'package:get/get.dart';

void main() {
  Get.put<UserController>(UserController());

  runApp(const MaterialApp(
    title: 'Your title',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetXPrincipal();
  }
}

class GetXPrincipal extends StatelessWidget {
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  var valueController = ValueController();

  final UserController userController = Get.find();

  GetXPrincipal({super.key});

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
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Teste();
                        },
                      ),
                    );
                  },
                  child: const Text('Listar dados'))
            ],
          ),
        ),
      ),
    );
  }
}

class Teste extends StatelessWidget {
  Teste({super.key});
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(56),
          child: Column(
            children: [
              Obx(() => Text('Nome: ${userController.user.value.name}')),
            ],
          ),
        ),
      ),
    );
  }
}
