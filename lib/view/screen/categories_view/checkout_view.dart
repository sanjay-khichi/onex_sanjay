import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/utility/common_button.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/homepage/home_navigator.dart';
import 'package:onex_sanjay/view/screen/homepage/homepage.dart';

class CheckOutView extends StatefulWidget {
  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int? groupValue ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      elevation: 0,
      backgroundColor: Constants.primaryColor,
    ),
    body: categoryBody(),
    );
  }

  categoryBody() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
              ),
              Positioned(
                bottom: -15,
                left: 15,
                right: 15,
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(Get.context!).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  //padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Constants.secondaryColor),
                        border: InputBorder.none,
                        prefixIcon:
                        Icon(Icons.search, color: Constants.secondaryColor),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.camera_alt,
                                color: Constants.secondaryColor),
                            Icon(Icons.mic, color: Constants.secondaryColor)
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(padding: EdgeInsets.all(10),child:  Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(Get.context!).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name",style: TextStyle(color: Constants.secondaryProductPriceColor,fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Text("Sanja Khichi",style: TextStyle(color: Constants.secondaryProductPriceColor)),
                              SizedBox(height: 5,),
                              Text("Shipping Address",style: TextStyle(color: Constants.secondaryProductPriceColor,fontWeight: FontWeight.bold)),
                              SizedBox(height: 15,),
                              Container(
                                height: 94,
                                width: MediaQuery.of(Get.context!).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Constants.secondaryProductPriceColor.withOpacity(0.2))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "PlusoneX India A - 204, SNS Atria, Opposite Jolly Party Plot, Vesu, Surat - 395007",
                                    style: TextStyle(
                                        color: Constants.secondaryColor,
                                      fontSize: 16
                                    ),
                              ),
                                ),)
                            ]),
                      ),)
                ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            RadioListTile(title: Text("Cash on Delivery",style: TextStyle(color: Constants.secondaryProductPriceColor)),value: 1, groupValue: groupValue, onChanged: (val){

                              setState(() {
                                groupValue = val;
                              });
                            }),
                            Container(color: Constants.secondaryProductPriceColor.withOpacity(0.1),height: 1,width: MediaQuery.of(Get.context!).size.width,),
                            RadioListTile(title:Text("Credit/Debit Car",style: TextStyle(color: Constants.secondaryProductPriceColor),),value: 2, groupValue: groupValue, onChanged: (val){
                              setState(() {
                                groupValue = val;
                              });
                            }),
                            Container(color: Constants.secondaryProductPriceColor.withOpacity(0.1),height: 1,width: MediaQuery.of(Get.context!).size.width,),
                            RadioListTile(title: Text("Pay via UPI",style: TextStyle(color: Constants.secondaryProductPriceColor),),value: 3, groupValue: groupValue, onChanged: (val){
                              setState(() {
                                groupValue = val;
                              });
                            }),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price",style: TextStyle(color: Constants.secondaryProductPriceColor)),
                              Text("₹ 5,700",style: TextStyle(color: Constants.secondaryProductPriceColor)),

                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery",style: TextStyle(color: Constants.secondaryProductPriceColor)),
                              Text("₹ 100",style: TextStyle(color: Constants.secondaryProductPriceColor)),

                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",style: TextStyle(color: Constants.secondaryProductPriceColor),),
                              Text("₹ 5,800",style: TextStyle(color: Constants.productPriceColor)),

                            ],
                          ),

                        ],
                      ),
                    ),),
                ],
              ),),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){Get.to(successDialog());},
                child: CommonButton(

                  backgroundColor: Constants.productPriceColor,
                  text: "Place Order",
                  heightSize: 55,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  successDialog(){
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child:
            Column(
              children: [
                SvgPicture.asset("assets/images/right.svg"),
                SizedBox(height: 5,),
                Text("Success",style: TextStyle(color: Constants.containerColor,fontSize: 24,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Your order# 200431254 has been successfully paid.It can be tracked in the“Your Order” section.",
                  style: TextStyle(
                      color:Constants.secondaryProductPriceColor),),
                SizedBox(height: 20,),
                InkWell(onTap: (){
                  Navigator.pushAndRemoveUntil(Get.context!, MaterialPageRoute(builder: (context) => HomeNavigator(),), (route) => false);
                },
                    child: CommonButton(backgroundColor: Constants.primaryColor, text: "Continue Shopping",heightSize: 60,)),
                SizedBox(height: 20,),
                Text("Go to Orders",style: TextStyle(color: Constants.primaryColor,fontWeight: FontWeight.bold),)
              ],
        ),
      ),
    );
  }
}
