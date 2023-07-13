import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mobile_app/model/user.dart';
import 'package:mobile_app/users/userPreferences/user_preferences.dart';

class CurrentUser extends GetxController
{
   Rx<User> _currentUser = User(
    0,
    '',
    '',
    '',
  ).obs;

  User get currentUser => _currentUser.value;

  getUserInfo() async
  {
    User? getUserInfoFromLocalStorage =await RememberUserPref.readUserInfo();
      _currentUser.value = getUserInfoFromLocalStorage!;
  }
}