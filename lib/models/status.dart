// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'package:henri_ppp/models/user.dart';

class StatusModel {
  String id;
  String statusText;
  String statusImage;
  String statusVideo;
  UserModel createdBy;
  String statusId;

  StatusModel({
    required this.id,
    required this.statusText,
    required this.statusImage,
    required this.statusVideo,
    required this.createdBy,
    required this.statusId,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        id: json["_id"],
        statusText: json["statusText"],
        statusImage: json["statusImage"],
        statusVideo: json["statusVideo"],
        createdBy: UserModel.fromJson(json["createdBy"]),
        statusId: json["statusID"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "statusText": statusText,
        "statusImage": statusImage,
        "statusVideo": statusVideo,
        "createdBy": createdBy.toJson(),
        "statusID": statusId,
      };
}
