class AddGroupModel {
  String? contactName;
  String? mobile;


  AddGroupModel({
    this.contactName,
    this.mobile,


  });

  AddGroupModel.fromJson(Map<String, dynamic> json) {
    contactName = json['contact_name'];
    mobile = json['mobile'];




  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_name'] = this.contactName;
    data['mobile'] = this.mobile;


    return data;
  }


}

