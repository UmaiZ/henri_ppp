import 'package:henri_ppp/models/user.dart';

class FeedModel {
  String? sId;
  UserModel? createdBy;
  String? description;
  List<String>? images;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FeedModel(
      {this.sId,
      this.createdBy,
      this.description,
      this.images,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  FeedModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdBy = UserModel.fromJson(json['createdBy']);
    description = json['description'];
    images = json['images'].cast<String>();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdBy'] = this.createdBy!.toJson();
    data['description'] = this.description;
    data['images'] = this.images;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
