class OrderListModel {
  List<Data>? data;

  OrderListModel({this.data});

  OrderListModel.fromJson(Map<String, dynamic> json) {
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
  String? userCreated;
  String? dateCreated;
  String? userUpdated;
  String? dateUpdated;
  String? name;
  String? address;
  List<OrderDetails>? orderDetails;
  int? orderTotal;

  Data(
      {this.id,
        this.userCreated,
        this.dateCreated,
        this.userUpdated,
        this.dateUpdated,
        this.name,
        this.address,
        this.orderDetails,
        this.orderTotal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCreated = json['user_created'];
    dateCreated = json['date_created'];
    userUpdated = json['user_updated'];
    dateUpdated = json['date_updated'];
    name = json['Name'];
    address = json['Address'];
    if (json['Order_Details'] != null) {
      orderDetails = <OrderDetails>[];
      json['Order_Details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    orderTotal = json['Order_Total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_created'] = this.userCreated;
    data['date_created'] = this.dateCreated;
    data['user_updated'] = this.userUpdated;
    data['date_updated'] = this.dateUpdated;
    data['Name'] = this.name;
    data['Address'] = this.address;
    if (this.orderDetails != null) {
      data['Order_Details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    data['Order_Total'] = this.orderTotal;
    return data;
  }
}

class OrderDetails {
  int? productID;
  String? productName;
  int? productPrice;

  OrderDetails({this.productID, this.productName, this.productPrice});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    productID = json['Product_ID'];
    productName = json['Product_Name'];
    productPrice = json['Product_Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Product_ID'] = this.productID;
    data['Product_Name'] = this.productName;
    data['Product_Price'] = this.productPrice;
    return data;
  }
}
