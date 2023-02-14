import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/controller/category_controller/category_controller.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/categories_view/category_details.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return categoryBody();
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
                  width: MediaQuery.of(context).size.width,
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
        Text(
          "Categories",
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: Obx(()=>GridView.builder(
              itemCount: categoryController.getCategoryList.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio:1.2
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    categoryController.fetchCategoryProductList(categoryController.getProductList.data!.where((element) => element.category!.id ==categoryController.getCategoryList.data![index].id!).toList());
                    Get.to(CategoryDetails());
                  },
                  child: Padding(padding: EdgeInsets.all(10),child: Column(
                    children: [
                      Container(

                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                          "https://tznwvelv.directus.app/assets/"+categoryController.getCategoryList.data![index].categoryImage!,height: 70,),
                      ),
                      SizedBox(height: 5,),
                      Text(categoryController.getCategoryList.data![index].title!,style: TextStyle(color: Constants.secondaryProductPriceColor),)
                    ],
                  ),),
                );
              },
            )))
      ],
    );
  }
}
