// ignore_for_file: unnecessary_getters_setters
class OccassionModel {
  final int id;
  final String image;
  final String name;
  final String ar_name;

  OccassionModel({
    required this.id,
    required this.image,
    required this.name,
    required this.ar_name,
  });

  factory OccassionModel.fromJson(Map<String, dynamic> json) {
    return OccassionModel(
      id: json['id']??0,
      image: json['image']??"",
      name: json['name']??"",
      ar_name: json['ar_name']??"",
    );
  }
}
