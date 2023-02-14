import 'dart:convert';

import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails{
  Future<LoginResponseModel> userInfo()async{
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> userMap = jsonDecode(prefs.getString("userDetails")!);
    return LoginResponseModel.fromJson(userMap);
  }
}