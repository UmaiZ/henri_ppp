class AverageRating {
  num? averageRating;
  num? postCount;
  List<Ratings>? ratings;

  AverageRating({this.averageRating, this.postCount, this.ratings});

  AverageRating.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    postCount = json['postCount'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageRating'] = averageRating;
    data['postCount'] = postCount;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ratings {
  num? count;
  String? description;
  String? createdAt;

  Ratings({this.count, this.description, this.createdAt});

  Ratings.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    description = json['description'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['description'] = description;
    data['createdAt'] = createdAt;
    return data;
  }
}
