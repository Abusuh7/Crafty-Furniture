import 'dart:convert';

import 'package:mobile_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPref
{
  //save-remember user info
  static Future<void> storeUserInfo(User userInfo) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString('currentUser', userJsonData);
  }

  //get-remember user info
  static Future<User?> readUserInfo() async
  {
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString('currentUser');
    if(userInfo != null)
    {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }


  //remove user data
  static Future<void> removeUserInfo() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('currentUser');
  }

  
}