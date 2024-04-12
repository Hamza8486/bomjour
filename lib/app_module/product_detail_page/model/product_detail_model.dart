class ProductDetailModel {
  bool? status;
  ProductDetailData? data;

  ProductDetailModel({this.status, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ProductDetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductDetailData {
  int? id;
  String? productName;
  String? productDescription;
  String? productOtherInfo;
  int? status;
  var productPrice;
  int? categoryId;
  int? priceId;
  int? busId;
  List<Images>? images;
  List<Occasions>? occasions;

  ProductDetailData(
      {this.id,
        this.productName,
        this.productDescription,
        this.productPrice,
        this.priceId,
        this.busId,
        this.productOtherInfo,
        this.status,
        this.categoryId,
        this.images,
        this.occasions});

  ProductDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productPrice = json['product_price'];
    priceId = json['price_id'];
    busId = json['business_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productOtherInfo = json['product_other_info'];
    status = json['status'];
    categoryId = json['category_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['occasions'] != null) {
      occasions = <Occasions>[];
      json['occasions'].forEach((v) {
        occasions!.add(new Occasions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_price'] = this.productPrice;
    data['business_id'] = this.busId;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_other_info'] = this.productOtherInfo;
    data['status'] = this.status;
    data['price_id'] = this.priceId;
    data['category_id'] = this.categoryId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.occasions != null) {
      data['occasions'] = this.occasions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? mediaId;
  int? productId;
  int? isFeatured;
  int? businessId;
  String? productImage;

  Images(
      {this.id,
        this.mediaId,
        this.productId,
        this.isFeatured,
        this.businessId,
        this.productImage});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    productId = json['product_id'];
    isFeatured = json['is_featured'];
    businessId = json['business_id'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_id'] = this.mediaId;
    data['product_id'] = this.productId;
    data['is_featured'] = this.isFeatured;
    data['business_id'] = this.businessId;
    data['product_image'] = this.productImage;
    return data;
  }
}

class Occasions {
  int? id;
  String? productName;
  int? status;
  String? name;
  String? createdAt;
  String? firstName;
  String? lastName;

  Occasions(
      {this.id,
        this.productName,
        this.status,
        this.name,
        this.createdAt,
        this.firstName,
        this.lastName});

  Occasions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    status = json['status'];
    name = json['name'];
    createdAt = json['created_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['status'] = this.status;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
