class OnBoardingModel {
  bool? status;
  List<OnBoardingModelData>? data;

  OnBoardingModel({this.status, this.data});

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <OnBoardingModelData>[];
      json['data'].forEach((v) {
        data!.add(new OnBoardingModelData.fromJson(v));
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

class OnBoardingModelData {
  int? id;
  String? title;
  String? arTitle;
  String? content;
  String? contentAr;
  String? image;

  OnBoardingModelData(
      {this.id,
        this.title,
        this.arTitle,
        this.content,
        this.contentAr,
        this.image});

  OnBoardingModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    arTitle = json['ar_title'];
    content = json['content'];
    contentAr = json['content_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ar_title'] = this.arTitle;
    data['content'] = this.content;
    data['content_ar'] = this.contentAr;
    data['image'] = this.image;
    return data;
  }
}
