import 'package:get/get.dart';

class ValueController extends GetxController {
  RxString textMain = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> setValue(String text) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    textMain.value = text;

    isLoading.value = false;
  }
}
