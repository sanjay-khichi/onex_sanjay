class SubCategoryModel {
  Data? data;

  SubCategoryModel({this.data});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? title;
  String? categoryImage;
  bool? categoryActive;

  Data({this.id, this.title, this.categoryImage, this.categoryActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    categoryImage = json['Category_Image'];
    categoryActive = json['Category_Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Category_Image'] = this.categoryImage;
    data['Category_Active'] = this.categoryActive;
    return data;
  }
}
