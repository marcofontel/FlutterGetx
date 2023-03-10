import 'package:flutter/material.dart';
import 'package:fluttergetx/user_controller.dart';
import 'package:fluttergetx/value_controller.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut<UserController>(() => UserController());

  runApp(const MaterialApp(
    title: 'Your title',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetXPrincipal(),
      debugShowCheckedModeBanner: false,
    );
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
              GetX<UserController>(
                builder: (controller) {
                  return Text('Nome: ${controller.user.value.name}');
                },
              ),
              GetX<UserController>(
                builder: (controller) {
                  return Text('Idade: ${controller.user.value.age}');
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
                  onPressed: () async {
                    final nome = await Get.to(() => Teste());
                    userController.setUserName(nome);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const Teste();
                    //     },
                    //   ),
                    // );
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
  // final UserController userController = Get.find();
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GetX<UserController>(
                builder: (controller) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            'Nome: ${controller.user.value.name}',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: TextField(
                  controller: textController,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back(result: textController.text);
                  },
                  child: const Text('Retornar'))
            ],
          ),
        ),
      ),
    );
  }
}
