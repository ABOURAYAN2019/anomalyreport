class TypeModel {
  late String? key;
  late String? type;
  late int? id;

  TypeModel({
    this.id,
    this.key,
    this.type,
  });

  TypeModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    id = map["id"];

    key = map["key"];
    type = map["type"];
  }

  toJson() {
    return {
      'key': key,
      'type': type,
      "id": id,
    };
  }
}
