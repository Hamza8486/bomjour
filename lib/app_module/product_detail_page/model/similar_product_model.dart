class GetSimilarModel {
  bool? status;
  List<AllSimilarPrroductModel>? data;

  GetSimilarModel({this.status, this.data});

  GetSimilarModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AllSimilarPrroductModel>[];
      json['data'].forEach((v) {
        data!.add(new AllSimilarPrroductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSimilarPrroductModel {
  String? businessName;
  String? productName;
  int? productId;
  String? productPrice;
  int? priceId;
  int? mediaId;
  String? imageName;
  int? businessId;
  String? createdAt;
  String? productImage;

  AllSimilarPrroductModel(
      {this.businessName,
        this.productName,
        this.productId,
        this.productPrice,
        this.priceId,
        this.mediaId,
        this.imageName,
        this.businessId,
        this.createdAt,
        this.productImage});

  AllSimilarPrroductModel.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    productName = json['product_name'];
    productId = json['product_id'];
    productPrice = json['product_price'];
    priceId = json['price_id'];
    mediaId = json['media_id'];
    imageName = json['image_name'];
    businessId = json['business_id'];
    createdAt = json['created_at'];
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
    data['created_at'] = this.createdAt;
    data['product_image'] = this.productImage;
    return data;
  }
}
