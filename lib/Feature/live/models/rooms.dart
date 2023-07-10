class Rooms {
  String? sId;
  String? channelName;
  Uid? uid;
  String? role;
  String? token;
  int? iV;

  Rooms({this.sId, this.channelName, this.uid, this.role, this.token, this.iV});

  Rooms.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    channelName = json['channelName'];
    uid = json['uid'] != null ? Uid.fromJson(json['uid']) : null;
    role = json['role'];
    token = json['token'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['channelName'] = channelName;
    if (uid != null) {
      data['uid'] = uid!.toJson();
    }
    data['role'] = role;
    data['token'] = token;
    data['__v'] = iV;
    return data;
  }
}

class Uid {
  String? sId;
  String? userName;
  String? userEmail;
  String? userImage;
  String? userID;

  Uid({this.sId, this.userName, this.userEmail, this.userImage, this.userID});

  Uid.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userImage = json['userImage'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userImage'] = userImage;
    data['userID'] = userID;
    return data;
  }
}
