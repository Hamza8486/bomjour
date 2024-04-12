class GetMyPreferenceModel {
  bool? status;
  String? message;
  List<MyPerfenceModel>? data;

  GetMyPreferenceModel({this.status, this.message, this.data});

  GetMyPreferenceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MyPerfenceModel>[];
      json['data'].forEach((v) {
        data!.add(new MyPerfenceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyPerfenceModel {
  int? id;
  String? name;
  int? status;
  int? typeId;
  int? preferenceCategoryId;
  String? type;
  int? createdBy;
 var deletedBy;
  var updatedBy;
  String? createdAt;
  String? updatedAt;
  var deletedAt;
  var arName;

  MyPerfenceModel(
      {this.id,
        this.name,
        this.status,
        this.typeId,
        this.preferenceCategoryId,
        this.type,
        this.createdBy,
        this.deletedBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.arName});

  MyPerfenceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    typeId = json['type_id'];
    preferenceCategoryId = json['preference_category_id'];
    type = json['type'];
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    arName = json['ar_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['type_id'] = this.typeId;
    data['preference_category_id'] = this.preferenceCategoryId;
    data['type'] = this.type;
    data['created_by'] = this.createdBy;
    data['deleted_by'] = this.deletedBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['ar_name'] = this.arName;
    return data;
  }
}
