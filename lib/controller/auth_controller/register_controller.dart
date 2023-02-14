import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/model/auth/access_token_model.dart';
import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:onex_sanjay/utility/generate_token_sc.dart';
import 'package:onex_sanjay/view/screen/homepage/home_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController{
  GenerateTokenSC generateTokenSC = GenerateTokenSC();

  var accessTokenModel = AccessTokenModel().obs;
  AccessTokenModel get getaccessTokenModel => accessTokenModel.value;
  set  setaccessTokenModel(AccessTokenModel val){
    accessTokenModel.value=val;
    accessTokenModel.refresh();
  }

  createUser({String? fName,lName,email,password})async{
    final prefs = await SharedPreferences.getInstance();
      LoginResponseModel responseModel = await generateTokenSC.generateToken();
      if(responseModel.data!=null){
        LoginResponseModel res = await   generateTokenSC.registerSC(firstName: fName,lastName: lName,email: email,password: password,token: responseModel.data!.accessToken!);
        if(res.data!=null){
          String userDetails = jsonEncode(responseModel);
          prefs.setString('userDetails', userDetails);
          Map<String,dynamic> userMap = jsonDecode(prefs.getString("userDetails")!);
          var user = LoginResponseModel.fromJson(userMap);
          print("====================user=============");
          print(user.toJson());
          Navigator.pushAndRemoveUntil(Get.context!, MaterialPageRoute(builder: (context) => HomeNavigator(),), (route) => false);
        }
      }
  }

}