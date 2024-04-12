class BusinessModel {
  int? id;
  String? businessName;
  String? businessShort;
  String? businessLong;
  int? businessStatus;
  int? isActive;
  int? logoMediaId;
  int? coverMediaId;
  int? createdBy;
  var deletedAt;
  String? createdAt;
  String? updatedAt;
  var brn;
  var trn;
  int? parentId;
  String? coverMedia;
  String? logoMedia;

  BusinessModel(
      {this.id,
        this.businessName,
        this.businessShort,
        this.businessLong,
        this.businessStatus,
        this.isActive,
        this.logoMediaId,
        this.coverMediaId,
        this.createdBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.brn,
        this.trn,
        this.parentId,
        this.coverMedia,
        this.logoMedia});

  BusinessModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    businessShort = json['business_short'];
    businessLong = json['business_long'];
    businessStatus = json['business_status'];
    isActive = json['is_active'];
    logoMediaId = json['logo_media_id'];
    coverMediaId = json['cover_media_id'];
    createdBy = json['created_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brn = json['brn'];
    trn = json['trn'];
    parentId = json['parent_id'];
    coverMedia = json['cover_media'];
    logoMedia = json['logo_media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_name'] = this.businessName;
    data['business_short'] = this.businessShort;
    data['business_long'] = this.businessLong;
    data['business_status'] = this.businessStatus;
    data['is_active'] = this.isActive;
    data['logo_media_id'] = this.logoMediaId;
    data['cover_media_id'] = this.coverMediaId;
    data['created_by'] = this.createdBy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['brn'] = this.brn;
    data['trn'] = this.trn;
    data['parent_id'] = this.parentId;
    data['cover_media'] = this.coverMedia;
    data['logo_media'] = this.logoMedia;
    return data;
  }
}
