import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/auth_controller/login_controller.dart';
import 'package:onex_sanjay/utility/common_button.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/homepage/home_navigator.dart';
import 'package:onex_sanjay/view/screen/homepage/homepage.dart';
import 'package:onex_sanjay/view/screen/login/register_form.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  bool? isChecked = false;
  LoginController loginController = Get.put(LoginController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
          children: [
            Column(
              children: [
                Container(
                  height: 55,
                  width: 370,
                  child: SvgPicture.asset("assets/images/title.svg"),
                ),
                SizedBox(height: 50),
                Text(
                  "Login to your Account",
                  style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    color: Constants.primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: Column(children: [
                    SizedBox(height: 40),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Constants.secondaryColor),
                          prefixIcon: Icon(
                            Icons.mail_sharp,
                            color: Constants.secondaryColor,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Constants.secondaryColor
                            )
                        ),
                    ),),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isPasswordVisible,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Constants.secondaryColor),
                          prefixIcon: Icon(
                            Icons.lock_rounded,
                            color: Constants.secondaryColor,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible?
                            Icon(
                              Icons.visibility_off,
                                    color: Constants.secondaryColor,
                                  ): Icon(Icons.visibility,
                                    color: Constants.secondaryColor),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:Constants.secondaryColor
                              ))),
                    ),])),
                    Row(
                      children: [
                        Checkbox(value: isChecked,
                            activeColor: Constants.secondaryColor,
                            onChanged:(value){
                          setState(() {
                            isChecked = value;
                          });
                            }),
                        Text(
                          "Remember me",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Constants.secondaryProductPriceColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeNavigator()));
                        loginController.fetchLoginDetails(emailController.text,passwordController.text);
                      },
                      child: CommonButton(
                          backgroundColor: Constants.containerColor,
                          text: "Sign in",
                          widthSize: 380,
                          heightSize: 60),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Forgot the password?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Constants.primaryColor),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Constants.secondaryProductPriceColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,color: Constants.primaryColor),
                            )),
                      ],
                    ),
              ],
            ),
          ]),
    );
  }
}
