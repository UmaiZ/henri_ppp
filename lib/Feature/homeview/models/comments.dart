import 'package:henri_ppp/Feature/profile/models/user.dart';

class CommentModel {
  String? sId;
  String? newsFeedId;
  String? commentDetail;
  UserModel? commentBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CommentModel(
      {this.sId,
      this.newsFeedId,
      this.commentDetail,
      this.commentBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CommentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    newsFeedId = json['newsFeedId'];
    commentDetail = json['commentDetail'];
    commentBy = json['commentBy'] != null
        ? new UserModel.fromJson(json['commentBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['newsFeedId'] = this.newsFeedId;
    data['commentDetail'] = this.commentDetail;
    if (this.commentBy != null) {
      data['commentBy'] = this.commentBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
