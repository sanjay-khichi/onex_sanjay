import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/order_list_controller/order_list_controller.dart';
import 'package:onex_sanjay/utility/common_button.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/categories_view/checkout_view.dart';
import 'package:readmore/readmore.dart';

class CartView extends StatefulWidget {

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  OrderListController orderListController = Get.put(OrderListController());
  @override
  void initState() {
    orderListController.orderList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                "Your Cart",
                style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 20,
              ),

              Expanded(child:  Obx ((){
                if(orderListController.getorderListModel.data!=null)
                 return  ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderListController.getorderListModel.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.only(left: 10,right: 10),child:  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://tfipost.com/wp-content/uploads/2022/04/Shinchan_in_hindi_dubbed_show.jpg",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Text(orderListController.getorderListModel.data![index].toString()),
                                    SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(Get.context!).size.width/2,
                                      child: ListView.builder(
                                        //shrinkWrap: true,
                                        itemCount: orderListController.getorderListModel.data![index].orderDetails!.length,
                                        itemBuilder: (context, index1) {
                                          return Text(orderListController.getorderListModel.data![index].orderDetails!  [index1].productName!);
                                        },),
                                    ),
                                    /*SizedBox(
                                   height: 50,
                                   width: MediaQuery.of(Get.context!).size.width/2,
                                   child: ListView.builder(
                                       itemCount: orderListController.getorderListModel.data![index].orderDetails!.length
                                       ,itemBuilder: (context ,index2){
                                     return *///Text(orderListController.getorderListModel.data![index].orderDetails! [index].productPrice.toString()),//}),

                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(color: Constants.secondaryProductPriceColor)
                                      ),
                                      child: Icon(Icons.add,size: 15),),
                                    SizedBox(width: 5,),
                                    Text("1"),
                                    SizedBox(width: 5,),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(color: Constants.secondaryProductPriceColor)
                                      ),
                                      child: Icon(Icons.remove,size: 15,),),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),),);
                  },);
                else
                  return SizedBox();
              }),),
              Padding(padding: EdgeInsets.all(10),child:  Card(
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
                ),),),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  Get.to(CheckOutView());
                },
                child: CommonButton(
                  backgroundColor: Constants.productPriceColor,
                  text: "Check Out",
                  heightSize: 55,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
