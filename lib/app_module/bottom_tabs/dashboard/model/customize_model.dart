class CustomizeModel {
  int? id;
  String? name;
  String? arName;

  CustomizeModel({this.id, this.name, this.arName});

  CustomizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    return data;
  }
}
