class Emplacementmodel {
  late String? key;
  late String? eqp;
  late String? id;

  Emplacementmodel({
    this.id,
    this.key,
    this.eqp,
  });

  Emplacementmodel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    id = map["id"];

    key = map["key"];
    eqp = map["eqp"];
  }

  toJson() {
    return {
      'key': key,
      'eqp': eqp,
      "id": id,
    };
  }
}
