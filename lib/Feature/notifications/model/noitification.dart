class notificationModel {
  String? sId;
  String? showto;
  String? notificationType;
  String? postid;
  String? notificationTitle;
  String? notificationSubtitle;
  int? iV;

  notificationModel(
      {this.sId,
      this.showto,
      this.notificationType,
      this.postid,
      this.notificationTitle,
      this.notificationSubtitle,
      this.iV});

  notificationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    showto = json['showto'];
    notificationType = json['notificationType'];
    postid = json['postid'];
    notificationTitle = json['notificationTitle'];
    notificationSubtitle = json['notificationSubtitle'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['showto'] = this.showto;
    data['notificationType'] = this.notificationType;
    data['postid'] = this.postid;
    data['notificationTitle'] = this.notificationTitle;
    data['notificationSubtitle'] = this.notificationSubtitle;
    data['__v'] = this.iV;
    return data;
  }
}
