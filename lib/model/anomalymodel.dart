class AnomalyModel {
  late String? id;
  late String? key;
  late String? emplacement;
  late String? type;
  late int? date;
  late String? image;
  late String? status;
  late String? comments;
  AnomalyModel(
      {this.image,
      this.id,
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
    image = map["image"];
    id = map["id"];
    key = map["key"];
    emplacement = map["emplacement"];
    type = map["type"];
    status = map["status"];
    date = map["date"];
  }

  toJson() {
    return {
      "id": id,
      "comments": comments,
      "key": key,
      "emplacement": emplacement,
      "type": type,
      "status": status,
      "date": date,
    };
  }
}
