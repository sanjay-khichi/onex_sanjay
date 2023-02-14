import 'package:dio/dio.dart';
import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:onex_sanjay/model/category_List_model/category_list_model.dart';

import 'package:onex_sanjay/model/product_model/product_model.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/utility/user_details.dart';

class CategorySC {
  Future<CartegoryListModel> categorySC() async {
    try {
      UserDetails userDetails = UserDetails();
      LoginResponseModel userinfo = await userDetails.userInfo();
      Response response;
      var dio = Dio();
      response = await dio.get("${Constants.baseUrl}/items/Category",
          options: Options(
            headers: {"Authorization": "Bearer ${userinfo.data!.accessToken!}"},
          ));
      print(response.data);

      return CartegoryListModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }
  Future<ProductListModel> productsSC() async {
    try {
      UserDetails userDetails = UserDetails();
      LoginResponseModel userinfo = await userDetails.userInfo();
      Response response;
      var dio = Dio();
      response = await dio.get("${Constants.baseUrl}/items/Products?fields[]=*&fields[]=Category.*", options: Options(
            headers: {"Authorization": "Bearer ${userinfo.data!.accessToken!}"},
          ));
      print("=================sub=======");
      print(response.data);

     return ProductListModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }
}
