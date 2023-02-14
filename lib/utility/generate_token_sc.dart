
 import 'package:dio/dio.dart';
import 'package:onex_sanjay/model/auth/login_model.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/utility/loader.dart';

class GenerateTokenSC{

  Future<LoginResponseModel> generateToken () async{
    var dio = Dio();
    Response response;
   response = await dio.post("${Constants.baseUrl}/auth/login",data: {
      "email": "tmehta@plusonex.com",
      "password": "Maven@123"
    });
   print("==================general token=========================");
   print(response.data);
   return LoginResponseModel.fromJson(response.data);
  }

Future<LoginResponseModel> registerSC({String? firstName, lastName, email, password,token}) async{
     try{
       showLoader();
       Response response;
       var dio = Dio();
       response = await dio.post("${Constants.baseUrl}/users",data:
       {
         "first_name": firstName,
         "last_name": lastName,
         "email": email,
         "password": password,
         "status": "active",
         "role": "dfsfd"
       },options: Options(headers: {"Authorization":"Bearer $token"}));
       print(response.data);
       closeLoader();
       return LoginResponseModel.fromJson(response.data);;
     } on DioError catch(e){
       closeLoader();
       throw e;

     }
}
 }