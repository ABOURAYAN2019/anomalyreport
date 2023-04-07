class UserModel {
  String? userId, email, name, pic;
  dynamic khatma;
  bool? isadmin;

  UserModel(
      {this.isadmin,
      this.khatma,
      this.userId,
      this.email,
      this.name,
      this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    isadmin = map['isadmin'];
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    khatma = map['khtama'];
  }

  toJson() {
    return {
      'isadmin': isadmin,
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'khatma': khatma
    };
  }
}
