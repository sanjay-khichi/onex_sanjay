import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/auth_controller/register_controller.dart';
import 'package:onex_sanjay/service/auth_sc/login_sc.dart';
import 'package:onex_sanjay/utility/common_button.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/utility/generate_token_sc.dart';
import 'package:onex_sanjay/view/screen/login/login.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? isChecked = false;
  bool isPasswordVisible = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GenerateTokenSC accessToken = GenerateTokenSC();
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: ListView(
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
                        "Register your Account",
                        style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold,
                            color: Constants.primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10),
                        child: Column(children: [
                          SizedBox(height: 40),
                          TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                                hintText: "First Name",
                                hintStyle: TextStyle(color: Constants.secondaryColor),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Constants.secondaryColor,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Constants.secondaryColor ))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                                hintText: "Last Name",
                                hintStyle: TextStyle(color: Constants.secondaryColor),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Constants.secondaryColor,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10
                            ),borderSide: BorderSide(color:Constants.secondaryColor ))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Constants.secondaryColor),
                                prefixIcon: Icon(
                                  Icons.mail_sharp,
                                  color: Constants.secondaryColor,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),focusedBorder:OutlineInputBorder(borderSide: BorderSide(color:Constants.secondaryColor ))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: isPasswordVisible,
                            controller: passwordController,
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
                                  borderRadius: BorderRadius.circular(10)
                                ),focusedBorder:OutlineInputBorder(borderSide: BorderSide(color:Constants.secondaryColor))),
                          ),
                        ],
                        )),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  activeColor: Constants.secondaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  }),
                              Text(
                                "I accept the",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Constants.secondaryProductPriceColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Terms & Conditions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Constants.secondaryProductPriceColor)),
                            ],
                          ),]),
                   InkWell(
                     onTap: (){
                       print("================registerController========");
                       registerController.createUser(fName: firstNameController.text,lName: lastNameController.text,password: passwordController.text,email: emailController.text);

                     },
                     child: CommonButton(
                backgroundColor: Constants.containerColor,
                text: "Sign in",
                widthSize: 100,
                heightSize: 60),
                   ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Constants.secondaryProductPriceColor),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){
                                        },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold,color: Constants.primaryColor),
                  ),
                ),
              ],
            ),

                        ]),
      ),


    );
  }
}
/* Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));*/
/* LoginSC l = LoginSC();
                    l.registerSC(firstName: "a",password: "as",email: "sanjaykhichi1659@gmail.com",lastName: "khi");*/
