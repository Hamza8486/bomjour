class OrderHistoryModel {
  Response? response;

  OrderHistoryModel({this.response});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
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
  List<OrderHistoryAllData>? data;
  int? status;

  Response({this.data, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderHistoryAllData>[];
      json['data'].forEach((v) {
        data!.add(new OrderHistoryAllData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class OrderHistoryAllData {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? createdAt;
  int? id;
  String? orderNumber;
  var total;
  int? statusId;
  String? orderStatus;
  int? isPaid;
  String? deliveryAddress;
  String? deliveryCity;
  String? deliveryCountry;
  List<Products>? products;

  OrderHistoryAllData(
      {this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.createdAt,
        this.id,
        this.orderNumber,
        this.total,
        this.statusId,
        this.orderStatus,
        this.isPaid,
        this.deliveryAddress,
        this.deliveryCity,
        this.deliveryCountry,
        this.products});

  OrderHistoryAllData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    createdAt = json['created_at'];
    id = json['id'];
    orderNumber = json['order_number'];
    total = json['total'];
    statusId = json['status_id'];
    orderStatus = json['order_status'];
    isPaid = json['is_paid'];
    deliveryAddress = json['delivery_address'];
    deliveryCity = json['delivery_city'];
    deliveryCountry = json['delivery_country'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['total'] = this.total;
    data['status_id'] = this.statusId;
    data['order_status'] = this.orderStatus;
    data['is_paid'] = this.isPaid;
    data['delivery_address'] = this.deliveryAddress;
    data['delivery_city'] = this.deliveryCity;
    data['delivery_country'] = this.deliveryCountry;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  String? productDescription;
  var unitPrice;
  int? quantity;
  int? businessId;
  String? imageName;
  String? productImage;

  Products(
      {this.productId,
        this.productName,
        this.productDescription,
        this.unitPrice,
        this.quantity,
        this.businessId,
        this.imageName,
        this.productImage});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
    businessId = json['business_id'];
    imageName = json['image_name'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['business_id'] = this.businessId;
    data['image_name'] = this.imageName;
    data['product_image'] = this.productImage;
    return data;
  }
}
