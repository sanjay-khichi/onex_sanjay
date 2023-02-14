import 'package:get/get.dart';
import 'package:onex_sanjay/model/order_list_model/order_list_model.dart';
import 'package:onex_sanjay/service/order_list_sc/order_list_sc.dart';

class OrderListController extends GetxController{
 OrderListSC orderListSC = OrderListSC();

 var orderListModel = OrderListModel().obs;
 OrderListModel get getorderListModel => orderListModel.value;
 set setorderListModel(OrderListModel val){
  orderListModel.value=val;
  orderListModel.refresh();
 }


 orderList()async {
  OrderListModel x = await orderListSC.orderListSC();
  setorderListModel = x;
 }
}