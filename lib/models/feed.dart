import 'package:henri_ppp/models/rating.dart';
import 'package:henri_ppp/models/user.dart';

class FeedModel {
  String? sId;
  UserModel? createdBy;
  String? description;
  List<String>? images;
  List<String>? comment;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Rating>? rating;

  FeedModel(
      {this.sId,
      this.createdBy,
      this.description,
      this.images,
      this.comment,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.iV});

  FeedModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdBy = json['createdBy'] != null
        ? new UserModel.fromJson(json['createdBy'])
        : null;
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(new Rating.fromJson(v));
      });
    }
    description = json['description'];
    images = json['images'].cast<String>();
    comment = json['comment'].cast<String>();

    isDeleted = json['isDeleted'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['images'] = this.images;
    data['comment'] = this.comment;

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Comment {
  String? sId;
  String? newsFeedId;
  String? commentDetail;
  String? commentBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Comment(
      {this.sId,
      this.newsFeedId,
      this.commentDetail,
      this.commentBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Comment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    newsFeedId = json['newsFeedId'];
    commentDetail = json['commentDetail'];
    commentBy = json['commentBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['newsFeedId'] = this.newsFeedId;
    data['commentDetail'] = this.commentDetail;
    data['commentBy'] = this.commentBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
