import 'package:fluttergetx/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  void setUserName(String userName) {
    user.value.name = userName;
    user.refresh();
  }

  void setUserAge(int userAge) {
    user.value.age = userAge;
    user.refresh();
  }
}
