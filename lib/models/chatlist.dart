class ChatListModel {
  String? sId;
  List<String>? users;
  String? type;
  int? iV;

  ChatListModel({this.sId, this.users, this.type, this.iV});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    users = json['users'].cast<String>();
    type = json['type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['users'] = this.users;
    data['type'] = this.type;
    data['__v'] = this.iV;
    return data;
  }
}
