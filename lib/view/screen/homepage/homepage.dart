import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/category_controller/category_controller.dart';
import 'package:onex_sanjay/utility/common_button.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/categories_view/categories_view.dart';
import 'package:onex_sanjay/controller/homepage_controller/homepage_controller.dart';
import 'package:onex_sanjay/view/screen/categories_view/category_details.dart';
import 'package:onex_sanjay/view/screen/login/authenticator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeController homeController = Get.put(HomeController());
  CategoryController categoryController = Get.put(CategoryController());
  @override
  void initState() {
    // TODO: implement initState
    categoryController.fetchSubCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Constants.primaryColor,
            elevation: 0,
            title: SvgPicture.asset("assets/images/title.svg", height: 40),
            actions: [],
          ),
        ),
        body: Obx(() {
          if (homeController.getDrawerIndex != 0) {
            return CategoryView();
          } else {
            return mainBody();
          }
        }), //mainBody(),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://tfipost.com/wp-content/uploads/2022/04/Shinchan_in_hindi_dubbed_show.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Text("Hi,"),
                    Text(
                      "Sanjay Khichi",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        homeController.setDrawerIndex = 0;
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Shop by Category'),
                      onTap: () {

                        homeController.setDrawerIndex = 1;
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Category 1'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Category 2'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Category 3'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Your Order'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Buy Again'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Your Wishlist'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Your Account'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Settings'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Support'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 20,
              ),
              InkWell(onTap: () async{
                print("==================userDetails================");
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("userDetails");
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Authenticator(),), (route) => false);
              },child:  CommonButton(
                backgroundColor: Constants.productPriceColor,
                text: "Logout",
                heightSize: 55,
              ),),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  mainBody() {
    return Column(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: Constants.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
              SizedBox(
                height: 10,
              ),
              Text(
                "All Categories",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx((){
                  if(categoryController.getCategoryList.data!=null)
                  return  ListView.builder(
                    itemCount: categoryController.getCategoryList.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){

                            print(categoryController.getCategoryList.data![index].id!);
                            print(jsonEncode(categoryController.getProductList.data!.where((element) => element.category!.id ==categoryController.getCategoryList.data![index].id!).toList()));
                            categoryController.fetchCategoryProductList(categoryController.getProductList.data!.where((element) => element.category!.id ==categoryController.getCategoryList.data![index].id!).toList());
                            Get.to(CategoryDetails(id: categoryController.getCategoryList.data![index].id!));
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Constants.containerColor,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 56,
                                width: 68,
                                child: Center(
                                  child: Image.network("https://tznwvelv.directus.app/assets/"+categoryController.getCategoryList.data![index].categoryImage!,height: 30),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                categoryController.getCategoryList.data![index].title!,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  else return SizedBox();
                }),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [popularProduct(), latestMobile(), latestFashion()],
            ),
          ),
        )
      ],
    );
  }

  popularProduct() {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Products",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "View All",
                style: TextStyle(fontSize: 22, color: Constants.secondaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (categoryController.getProductList.data!=null)
          SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
              child: ListView.builder(
                itemCount: categoryController.getProductList.data!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 40, right: 40, top: 40, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://tznwvelv.directus.app/assets/"+categoryController.getProductList.data![index].image!  ,
                            height: MediaQuery.of(context).size.width / 3,
                            width: MediaQuery.of(context).size.width / 3,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            categoryController.getProductList.data![index].price!.toString(),
                            style:
                                TextStyle(color: Constants.productPriceColor),
                          ),
                          SizedBox(
                           width: MediaQuery.of(context).size.width / 4,
                            child: Text(
                              maxLines:2,
                              categoryController.getProductList.data![index].title!,
                              style: TextStyle(
                                  color: Constants.secondaryProductPriceColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  latestMobile() {
    if(categoryController.getMobileProductList!=null)
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Mobiles",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "View All",
                style: TextStyle(fontSize: 22, color: Constants.secondaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
              child: ListView.builder(
                itemCount: categoryController.getMobileProductList!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 40, right: 40, top: 40, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://tznwvelv.directus.app/assets/"+categoryController.getMobileProductList[index].image!,
                            height: MediaQuery.of(context).size.width / 3,
                            width: MediaQuery.of(context).size.width / 3,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            categoryController.getMobileProductList[index].price.toString(),
                            style:
                                TextStyle(color: Constants.productPriceColor),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/4,
                            child: Text(

                            categoryController.getMobileProductList[index].title!,
                            maxLines: 2,
                            style: TextStyle(
                                color: Constants.secondaryProductPriceColor),
                          ),)
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  latestFashion() {
    if(categoryController.getLaptopProductList!=null)
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Laptop",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "View All",
                style: TextStyle(fontSize: 22, color: Constants.secondaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
              child: ListView.builder(
                itemCount: categoryController.getLaptopProductList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 40, right: 40, top: 40, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://tznwvelv.directus.app/assets/"+ categoryController.getLaptopProductList[index].image!,
                            height: MediaQuery.of(context).size.width / 3,
                            width: MediaQuery.of(context).size.width / 3,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            categoryController.getLaptopProductList[index].price.toString(),
                            style:
                                TextStyle(color: Constants.productPriceColor),
                          ),
                         SizedBox(
                           width: MediaQuery.of(context).size.width/4,
                           child:   Text(
                             maxLines:2,
                           categoryController.getLaptopProductList[index].title!,
                           style: TextStyle(
                               color: Constants.secondaryProductPriceColor),
                         ),)
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }



}
