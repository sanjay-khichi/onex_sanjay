class CartegoryListModel {
  List<Data>? data;

  CartegoryListModel({this.data});

  CartegoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
