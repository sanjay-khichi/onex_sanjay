class ProductListModel {
  List<Data>? data;

  ProductListModel({this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? image;
  int? price;
  bool? active;
  Category? category;

  Data(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.price,
        this.active,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    description = json['Description'];
    image = json['Image'];
    price = json['Price'];
    active = json['Active'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Image'] = this.image;
    data['Price'] = this.price;
    data['Active'] = this.active;
    if (this.category != null) {
      data['Category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? categoryImage;
  bool? categoryActive;

  Category({this.id, this.title, this.categoryImage, this.categoryActive});

  Category.fromJson(Map<String, dynamic> json) {
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
