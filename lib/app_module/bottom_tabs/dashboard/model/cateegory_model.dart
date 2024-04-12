class CategoryModel {
  int? id;
  String? name;
  String? arName;
  String? categoryImage;

  CategoryModel({this.id, this.name, this.arName, this.categoryImage});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
