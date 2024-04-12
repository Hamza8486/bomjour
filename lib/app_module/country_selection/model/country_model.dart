class CountryModel {
  int? id;
  String? countryName;
  String? countryNameAr;

  CountryModel({this.id, this.countryName, this.countryNameAr});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    countryNameAr = json['country_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_name'] = this.countryName;
    data['country_name_ar'] = this.countryNameAr;
    return data;
  }
}
