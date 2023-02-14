import 'package:dio/dio.dart';
import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:onex_sanjay/model/order_list_model/order_list_model.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/utility/user_details.dart';

class OrderListSC {
 Future<OrderListModel> orderListSC()async{
   try{
     var dio = Dio();
     UserDetails userDetails = UserDetails();
     LoginResponseModel userInfo = await userDetails.userInfo();
     print(userInfo.data!.accessToken!);
     Response response;
     response =  await dio.get("${Constants.baseUrl}/items/Orders",options: Options(headers: {"Authorization":"Bearer ${userInfo.data!.accessToken!}"}));
     print(response.data);
     return OrderListModel.fromJson(response.data);
   }catch(e){
     throw e;
   }
 }
}