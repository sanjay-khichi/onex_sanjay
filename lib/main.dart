import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/view/screen/login/authenticator.dart';
import 'package:onex_sanjay/view/screen/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFC5C5C5),

      ),
      home: Authenticator(),


    );
  }
}
