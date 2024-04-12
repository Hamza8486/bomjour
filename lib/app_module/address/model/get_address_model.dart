class GetAddressModel {
  Response? response;

  GetAddressModel({this.response});

  GetAddressModel.fromJson(Map<String, dynamic> json) {
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
  List<AddressModelAllData>? data;
  String? message;
  int? status;

  Response({this.data, this.message, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AddressModelAllData>[];
      json['data'].forEach((v) {
        data!.add(new AddressModelAllData.fromJson(v));
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

class AddressModelAllData {
  int? id;
  String? address;
  String? addressNickname;
  String? floorNo;
  String? city;
  String? latitude;
  String? longitude;
  String? propertyType;
  int? propertyTypeId;

  AddressModelAllData(
      {this.id,
        this.address,
        this.addressNickname,
        this.floorNo,
        this.city,
        this.latitude,
        this.longitude,
        this.propertyType,
        this.propertyTypeId});

  AddressModelAllData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    addressNickname = json['address_nickname'];
    floorNo = json['floor_no'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyType = json['property_type'];
    propertyTypeId = json['property_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['address_nickname'] = this.addressNickname;
    data['floor_no'] = this.floorNo;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['property_type'] = this.propertyType;
    data['property_type_id'] = this.propertyTypeId;
    return data;
  }
}
