import 'package:fluttergetx/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  Future<void> setUserName(String userName) async {
    user.update((val) {
      val?.name = userName;
    });

    Future<void> setUserAge(int userAge) async {
      user.update((val) {
        val?.age = userAge;
      });
    }
  }
}
