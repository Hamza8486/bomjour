class WishlistModel {
  Response? response;

  WishlistModel({this.response});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  List<WishListModelAllData>? data;
  String? message;
  int? status;

  Response({this.data, this.message, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WishListModelAllData>[];
      json['data'].forEach((v) {
        data!.add(new WishListModelAllData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class WishListModelAllData {
  String? title;
  int? productId;
  Null? wrapperId;
  int? businessId;
  int? id;
  String? type;
  int? typeId;
  int? customerId;
  String? imageName;
  String? price;
  String? description;
  String? itemImage;

  WishListModelAllData(
      {this.title,
        this.productId,
        this.wrapperId,
        this.businessId,
        this.id,
        this.type,
        this.typeId,
        this.customerId,
        this.imageName,
        this.price,
        this.description,
        this.itemImage});

  WishListModelAllData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    productId = json['product_id'];
    wrapperId = json['wrapper_id'];
    businessId = json['business_id'];
    id = json['id'];
    type = json['type'];
    typeId = json['type_id'];
    customerId = json['customer_id'];
    imageName = json['image_name'];
    price = json['price'];
    description = json['description'];
    itemImage = json['item_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['product_id'] = this.productId;
    data['wrapper_id'] = this.wrapperId;
    data['business_id'] = this.businessId;
    data['id'] = this.id;
    data['type'] = this.type;
    data['type_id'] = this.typeId;
    data['customer_id'] = this.customerId;
    data['image_name'] = this.imageName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['item_image'] = this.itemImage;
    return data;
  }
}
