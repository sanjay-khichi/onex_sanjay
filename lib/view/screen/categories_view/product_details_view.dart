import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:onex_sanjay/utility/common_button.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/categories_view/cart_view.dart';
import 'package:readmore/readmore.dart';
import 'package:onex_sanjay/model/product_model/product_model.dart' as data;
class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({this.categoryData});
  data.Data? categoryData;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final CarouselController _controller = CarouselController();
   List<String> imgList = [];
  @override
  void initState() {
    // TODO: implement initState
    imgList = ["https://tznwvelv.directus.app/assets/"+widget.categoryData!.image!];
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Stack(alignment: Alignment.center, children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.favorite,color: Colors.red,)),
                            Container(
                            height: MediaQuery.of(Get.context!).size.width / 2,
                            width: MediaQuery.of(Get.context!).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: CarouselSlider(
                              items: imgList.map((item) =>Image.network(item, fit: BoxFit.fill, )).toList(),
                              options: CarouselOptions(enlargeCenterPage: true, height: 200,),
                              carouselController: _controller,
                            ),
                    ),
                          ],
                        ),
                      ),),
                  ),
                  Center(
                    child: Positioned(
                        //   bottom: 90,
                        child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            _controller.previousPage();
                          }, icon: Icon(Icons.arrow_back_ios,color: Constants.secondaryProductPriceColor,)),
                          IconButton(onPressed: (){
                            _controller.nextPage();
                          }, icon: Icon(Icons.arrow_forward_ios,color: Constants.secondaryProductPriceColor,))
                        ],
                      ),
                    )),
                  )
                ]),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.categoryData!.category!.title!),
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
                  ],)),
                SizedBox(height: 5,),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.categoryData!.title!,style: TextStyle(color: Constants.secondaryProductPriceColor),),
                    Text("₹ ${widget.categoryData!.price.toString()}"),

                  ],)),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: ReadMoreText(widget.categoryData!.description!,
      trimLines: 2,
      colorClickableText: Constants.productPriceColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      style: TextStyle(color: Constants.secondaryProductPriceColor),
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),),SizedBox(height: 20,),
                InkWell(onTap: (){

                  //Get.to(CartView());
                  Get.to(()=>CartView());
                },child: CommonButton(backgroundColor: Constants.productPriceColor, text: "Add to Cart",heightSize: 55,))
              ],
            ),
          ),
        )
      ],
    );
  }
}
