import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:onex_sanjay/service/auth_sc/login_sc.dart';
import 'package:onex_sanjay/view/screen/homepage/home_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  LoginSC loginSC = LoginSC();
  fetchLoginDetails(String email,password) async{

    print("=================401==========");
    print(email);
    print(password);
    final prefs = await SharedPreferences.getInstance();
    try{

      LoginResponseModel responseModel = await loginSC.loginSC(email:email,password: password );
      String userDetails = jsonEncode(responseModel);
      prefs.setString('userDetails', userDetails);
      Map<String,dynamic> userMap = jsonDecode(prefs.getString("userDetails")!);
      var user = LoginResponseModel.fromJson(userMap);
      print("====================user=============");
      print(user.toJson());
      Navigator.pushAndRemoveUntil(Get.context!, MaterialPageRoute(builder: (context) => HomeNavigator(),), (route) => false);
    }catch(e){

    }


  }

  Stream<int> authChecker() async*{
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> userMap = jsonDecode(prefs.getString("userDetails")!);
    var user = LoginResponseModel.fromJson(userMap);
    if(user.data==null){
      yield 0;
    }else{
      yield 1;
    }
  }



}