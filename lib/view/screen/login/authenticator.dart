import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/auth_controller/login_controller.dart';
import 'package:onex_sanjay/view/screen/homepage/home_navigator.dart';
import 'package:onex_sanjay/view/screen/login/login.dart';
class Authenticator extends StatelessWidget {
   Authenticator({Key? key}) : super(key: key);

  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.authChecker(),
      builder: (context, snapshot) {
        print(snapshot.data);
      if(snapshot.data==null){
        return LoginPage();
      }else{
        return HomeNavigator();
      }
    },);
  }
}
