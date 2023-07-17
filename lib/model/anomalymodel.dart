class AnomalyModel {
  late String? id;
  late String? key;
  late String? emplacement;
  late String? type;
  late int? date;
  late String? image;
  late String? status;
  late String? comments;
  late String? description;
  late String? user;
  late int? adddate;
  late int? updatedate;
  late String? updater;
  late int? terminatedate;
  AnomalyModel(
      {this.updater,
      this.image,
      this.user,
      this.description,
      this.id,
      this.adddate,
      this.updatedate,
      this.terminatedate,
      this.key,
      this.emplacement,
      this.type,
      this.status,
      this.date,
      this.comments});

  AnomalyModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    comments = map["comments"];
    updater = map["updater"];
    image = map["image"];
    id = map["id"];
    key = map["key"];
    description = map["description"];
    emplacement = map["emplacement"];
    type = map["type"];
    status = map["status"];
    date = map["date"];
    user = map["user"];
    updatedate = map["updatedate"];
    terminatedate = map["terminatedate"];
    adddate = map["adddate"];
  }

  toJson() {
    return {
      "image": image,
      "id": id,
      "comments": comments,
      "key": key,
      "emplacement": emplacement,
      "type": type,
      "status": status,
      "date": date,
      "description": description,
      "user": user,
      "adddate": adddate,
      "updatedate": updatedate,
      "terminatedate": terminatedate,
      "updater": updater
    };
  }
}
