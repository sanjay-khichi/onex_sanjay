class LoginResponseModel {
  Data? data;

  LoginResponseModel({this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  int? expires;
  String? refreshToken;

  Data({this.accessToken, this.expires, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expires = json['expires'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires'] = this.expires;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
