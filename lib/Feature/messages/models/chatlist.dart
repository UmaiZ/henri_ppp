import 'package:henri_ppp/Feature/profile/models/user.dart';

class ChatListModel {
  String? sId;
  List<UserModel>? users;

  String? type;
  int? iV;

  ChatListModel({this.sId, this.users, this.type, this.iV});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(new UserModel.fromJson(v));
      });
    }
    type = json['type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['users'] = this.users;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    data['__v'] = this.iV;
    return data;
  }
}
