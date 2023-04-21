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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['userFirstName'] = this.userFirstName;
    data['userLastName'] = this.userLastName;
    data['userPassword'] = this.userPassword;
    data['userEmail'] = this.userEmail;
    data['userCity'] = this.userCity;
    data['userAddress'] = this.userAddress;
    data['userCountry'] = this.userCountry;
    data['userNumber'] = this.userNumber;
    data['userImage'] = this.userImage;
    data['userCover'] = this.userCover;
    data['userSchool'] = this.userSchool;
    data['userTeam'] = this.userTeam;
    data['userCoaches'] = this.userCoaches;
    data['userBio'] = this.userBio;
    data['userSports'] = this.userSports;
    data['__v'] = this.iV;
    data['userToken'] = this.userToken;
    return data;
  }
}
