import 'package:dio/dio.dart';
import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/utility/loader.dart';

class LoginSC {
  //baseUrl

  Future<LoginResponseModel> loginSC({String? email, String ?password}) async {
    try{
      showLoader();
      Response response;
      var dio = Dio();
      response = await dio.post("${Constants.baseUrl}/auth/login", data: {'email': email, 'password': password});
      print(response.data);
      closeLoader();
      return LoginResponseModel.fromJson(response.data);
    }on DioError  catch(e){
      print(e.response);
      closeLoader();
      throw e;
    }
  }


}
