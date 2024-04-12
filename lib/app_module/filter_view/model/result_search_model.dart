class ResultSearchModel {
  Response? response;

  ResultSearchModel({this.response});

  ResultSearchModel.fromJson(Map<String, dynamic> json) {
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
  List<FilterModelAllData>? data;
  String? message;
  int? status;

  Response({this.data, this.message, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FilterModelAllData>[];
      json['data'].forEach((v) {
        data!.add(new FilterModelAllData.fromJson(v));
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

class FilterModelAllData {
  String? businessName;
  String? productName;
  int? productId;
  var productPrice;
  int? priceId;
  int? mediaId;
  String? imageName;
  int? businessId;
  String? productAvailabilityStatus;
  int? capacity;
  String? createdAt;
  int? wishlistId;
  String? productImage;

  FilterModelAllData(
      {this.businessName,
        this.productName,
        this.productId,
        this.productPrice,
        this.priceId,
        this.mediaId,
        this.imageName,
        this.businessId,
        this.productAvailabilityStatus,
        this.capacity,
        this.createdAt,
        this.wishlistId,
        this.productImage});

  FilterModelAllData.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    productName = json['product_name'];
    productId = json['product_id'];
    productPrice = json['product_price'];
    priceId = json['price_id'];
    mediaId = json['media_id'];
    imageName = json['image_name'];
    businessId = json['business_id'];
    productAvailabilityStatus = json['product_availability_status'];
    capacity = json['capacity'];
    createdAt = json['created_at'];
    wishlistId = json['wishlist_id'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['product_name'] = this.productName;
    data['product_id'] = this.productId;
    data['product_price'] = this.productPrice;
    data['price_id'] = this.priceId;
    data['media_id'] = this.mediaId;
    data['image_name'] = this.imageName;
    data['business_id'] = this.businessId;
    data['product_availability_status'] = this.productAvailabilityStatus;
    data['capacity'] = this.capacity;
    data['created_at'] = this.createdAt;
    data['wishlist_id'] = this.wishlistId;
    data['product_image'] = this.productImage;
    return data;
  }
}
