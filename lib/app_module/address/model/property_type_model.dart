class GetPropertyTypeModel {
  bool? status;
  List<PropertyAllModel>? data;

  GetPropertyTypeModel({this.status, this.data});

  GetPropertyTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <PropertyAllModel>[];
      json['data'].forEach((v) {
        data!.add(new PropertyAllModel.fromJson(v));
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

class PropertyAllModel {
  int? id;
  String? type;
  String? typeAr;

  PropertyAllModel({this.id, this.type, this.typeAr});

  PropertyAllModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    typeAr = json['type_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['type_ar'] = this.typeAr;
    return data;
  }
}
