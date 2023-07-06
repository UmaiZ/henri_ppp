class Rating {
  String? sId;
  String? newsFeedId;
  String? ratingBy;
  num? rating;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['newsFeedId'] = newsFeedId;
    data['ratingBy'] = ratingBy;
    data['rating'] = rating;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
