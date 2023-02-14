import 'package:get/get.dart';
import 'package:onex_sanjay/model/category_List_model/category_list_model.dart';
import 'package:onex_sanjay/model/product_model/product_model.dart';
import 'package:onex_sanjay/model/product_model/product_model.dart' as data;
import 'package:onex_sanjay/service/category_sc/category_sc.dart';

class CategoryController extends GetxController{
  CategoryController(){
    fetchCategory();
  }
  CategorySC category = CategorySC();

  var categoryList = CartegoryListModel().obs;
  CartegoryListModel get getCategoryList => categoryList.value;
  set setCategoryList(CartegoryListModel val){
    categoryList.value = val;
    categoryList.refresh();
  }
  fetchCategory( )async{
    CartegoryListModel data = await category.categorySC();
    setCategoryList = data;
  }
  var productList = ProductListModel().obs;
  ProductListModel get getProductList => productList.value;
  set setProductList(ProductListModel val){
    productList.value = val;
    productList.refresh();
  }

  var mobileProductList = <data.Data>[].obs;
  List<data.Data> get getMobileProductList => mobileProductList.value;
  set setMobileProductList(data.Data val){
    mobileProductList.value.add(val);
    mobileProductList.refresh();
  }
  var laptopProductList = <data.Data>[].obs;
  List<data.Data> get getLaptopProductList => laptopProductList.value;
  set setLaptopProductList(data.Data val){
    laptopProductList.value.add(val);
    laptopProductList.refresh();
  }

  fetchSubCategory( )async{
    mobileProductList.clear();
    ProductListModel data = await category.productsSC();
    setProductList = data;
     data.data!.where((element) => element.category!.title=="Mobile").forEach((element) {
       setMobileProductList = element;
     });
     data.data!.where((element) => element.category!.title=="Laptop").forEach((element) {
       setLaptopProductList = element;
     });
  }


  var categoryProductList = <data.Data>[].obs;
  List<data.Data> get getCategoryProductList => categoryProductList.value;
  set setCategoryProductList(List<data.Data> val){
    categoryProductList.value = val;
    categoryProductList.refresh();
  }
  fetchCategoryProductList(List<data.Data> val){
   setCategoryProductList = val;

  }
}