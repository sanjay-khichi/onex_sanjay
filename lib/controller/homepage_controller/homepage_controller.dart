import 'package:get/get.dart';
import 'package:onex_sanjay/model/category_List_model/category_list_model.dart';
import 'package:onex_sanjay/service/category_sc/category_sc.dart';

class HomeController extends GetxController{
  HomeController(){

  }
  var drawerIndex = 0.obs;
  int get getDrawerIndex => drawerIndex.value;
  set setDrawerIndex(int val){
    drawerIndex.value = val;
    drawerIndex.refresh();
  }

  //items/Category

}