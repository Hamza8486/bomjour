class AllWrapperModel {
  bool? status;
  List<AllWrapperData>? data;

  AllWrapperModel({this.status, this.data});

  AllWrapperModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AllWrapperData>[];
      json['data'].forEach((v) {
        data!.add(new AllWrapperData.fromJson(v));
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

class AllWrapperData {
  int? id;
  String? title;
  var mediaId;
  int? createdFrom;
  int? createdBy;
  var deletedBy;
  var updatedBy;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  var deletedAt;
  String? wrapperColor;
  int? businessId;
  int? wrapperTypeId;
  bool? status;
  String? image;
  int? type;

  AllWrapperData(
      {this.id,
        this.title,
        this.mediaId,
        this.createdFrom,
        this.createdBy,
        this.deletedBy,
        this.updatedBy,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.wrapperColor,
        this.businessId,
        this.wrapperTypeId,
        this.status,
        this.image,
        this.type});

  AllWrapperData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mediaId = json['media_id'];
    createdFrom = json['created_from'];
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    wrapperColor = json['wrapper_color'];
    businessId = json['business_id'];
    wrapperTypeId = json['wrapper_type_id'];
    status = json['status'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['media_id'] = this.mediaId;
    data['created_from'] = this.createdFrom;
    data['created_by'] = this.createdBy;
    data['deleted_by'] = this.deletedBy;
    data['updated_by'] = this.updatedBy;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['wrapper_color'] = this.wrapperColor;
    data['business_id'] = this.businessId;
    data['wrapper_type_id'] = this.wrapperTypeId;
    data['status'] = this.status;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}
