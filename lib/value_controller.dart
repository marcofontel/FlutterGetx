import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ValueController extends GetxController {
  String textMain = '';
  bool isLoading = false;

  Future<void> setValue(String text) async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 2));

    textMain = text;

    isLoading = false;
    update();
  }
}
