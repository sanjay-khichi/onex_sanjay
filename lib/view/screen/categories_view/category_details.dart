import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/category_controller/category_controller.dart';
import 'package:onex_sanjay/model/product_model/product_model.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/categories_view/product_details_view.dart';


class CategoryDetails extends StatefulWidget {
   CategoryDetails({this.id}) ;
   int? id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryController categoryController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    //categoryController.fetchSubCategory(widget.id!);
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
        Expanded(child:  SingleChildScrollView(child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: MediaQuery.of(Get.context!).size.width / 2,
                decoration: BoxDecoration(
                    color: Constants.productPriceColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Categories",
              style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: categoryController.getCategoryProductList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 0.5,
                  childAspectRatio: 0.5),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){
                      Get.to(ProductDetailsView(categoryData:categoryController.getCategoryProductList[index]));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.favorite,color: Colors.red,)),
                          SizedBox(height: 10,),
                          Image.network(
                            "https://tznwvelv.directus.app/assets/"+ categoryController.getCategoryProductList[index].image!,
height: 100,                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            categoryController.getCategoryProductList[index].price.toString()!,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            categoryController.getCategoryProductList[index].title!,
                            style:
                            TextStyle(color: Constants.secondaryProductPriceColor),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 10.0,
                          direction: Axis.horizontal,
                        ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            categoryController.getCategoryProductList[index].price.toString()!,
                            style:
                            TextStyle(color: Constants.secondaryProductPriceColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),),)
      ],
    );
  }
}
