class UserModel {
  String? sId;
  String? userName;
  String? userFirstName;
  String? userLastName;
  String? userPassword;
  String? userEmail;
  String? userCity;
  String? userAddress;
  String? userCountry;
  String? userNumber;
  String? userImage;
  String? userCover;
  String? userSchool;
  String? userTeam;
  String? userCoaches;
  String? userBio;
  String? userSports;
  int? iV;
  String? userToken;
  List<String>? userFollowers;
  List<String>? userFollowing;

  UserModel(
      {this.sId,
      this.userName,
      this.userFirstName,
      this.userLastName,
      this.userPassword,
      this.userEmail,
      this.userCity,
      this.userAddress,
      this.userCountry,
      this.userNumber,
      this.userImage,
      this.userCover,
      this.userSchool,
      this.userTeam,
      this.userCoaches,
      this.userBio,
      this.userSports,
      this.userFollowers,
      this.userFollowing,
      this.iV,
      this.userToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    userFirstName = json['userFirstName'];
    userLastName = json['userLastName'];
    userPassword = json['userPassword'];
    userEmail = json['userEmail'];
    userCity = json['userCity'];
    userAddress = json['userAddress'];
    userCountry = json['userCountry'];
    userNumber = json['userNumber'];
    userImage = json['userImage'];
    userCover = json['userCover'];
    userSchool = json['userSchool'];
    userTeam = json['userTeam'];
    userCoaches = json['userCoaches'];
    userBio = json['userBio'];
    userSports = json['userSports'];
    iV = json['__v'];
    userToken = json['userToken'];
    userFollowers = json['userFollowers'].cast<String>();
    userFollowing = json['userFollowing'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['userFirstName'] = userFirstName;
    data['userLastName'] = userLastName;
    data['userPassword'] = userPassword;
    data['userEmail'] = userEmail;
    data['userCity'] = userCity;
    data['userAddress'] = userAddress;
    data['userCountry'] = userCountry;
    data['userNumber'] = userNumber;
    data['userImage'] = userImage;
    data['userCover'] = userCover;
    data['userSchool'] = userSchool;
    data['userTeam'] = userTeam;
    data['userCoaches'] = userCoaches;
    data['userBio'] = userBio;
    data['userSports'] = userSports;
    data['__v'] = iV;
    data['userToken'] = userToken;
    data['userFollowers'] = userFollowers;
    data['userFollowing'] = userFollowing;

    return data;
  }
}
