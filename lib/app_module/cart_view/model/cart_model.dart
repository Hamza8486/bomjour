class AddProductModel {
  String? productName;
  String? productId;
  String? productWeight;
  String? productPrice;
  String? productPriceId;
  String? productDiscount;
  String? productImage;
  String? total;
  String? subtotal;
  String? type;
  String? quantity;
  String? busId;

  AddProductModel({
    this.productName,
    this.productId,
    this.productPriceId,
    this.productWeight,
    this.productPrice,
    this.productDiscount,
    this.productImage,
    this.total,
    this.subtotal,
    this.type,
    this.quantity,
    this.busId,

  });

  AddProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productId = json['type_id'];
    productPriceId = json['price_id'];
    productWeight = json['unit_price'];
    productPrice = json['unit_price'];
    productDiscount = json['productDiscount'];
    productImage = json['productImage'];
    total = json['total'];
    subtotal = json['subtotal'];
    type = json['type'];
    quantity = json['quantity'];
    busId = json['business_id'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['type_id'] = this.productId;
    data['price_id'] = this.productPriceId;
    data['unit_price'] = this.productWeight;
    data['unit_price'] = this.productPrice;
    data['productDiscount'] = this.productDiscount;
    data['productImage'] = this.productImage;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    data['type'] = this.type;
    data['quantity'] = this.quantity;
    data['business_id'] = this.busId;

    return data;
  }


}

