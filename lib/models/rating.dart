class Rating {
  String? sId;
  String? newsFeedId;
  String? ratingBy;
  double? rating;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Rating(
      {this.sId,
      this.newsFeedId,
      this.ratingBy,
      this.rating,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Rating.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    newsFeedId = json['newsFeedId'];
    ratingBy = json['ratingBy'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['newsFeedId'] = this.newsFeedId;
    data['ratingBy'] = this.ratingBy;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
