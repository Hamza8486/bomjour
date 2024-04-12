class GetProfileModel {
  bool? status;
  String? message;
  ProfileModelData? data;

  GetProfileModel({this.status, this.message, this.data});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ProfileModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileModelData {
  int? id;
  String? email;
  String? otp;
  String? firstName;
  String? lastName;
  String? phone;
  String? imgPath;

  ProfileModelData(
      {this.id,
        this.email,
        this.otp,
        this.firstName,
        this.lastName,
        this.phone,
        this.imgPath});

  ProfileModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    imgPath = json['img_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['img_path'] = this.imgPath;
    return data;
  }
}
