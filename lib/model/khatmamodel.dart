class KhatmaModel {
  late int? id;
  late bool? finished = false;
  late String? key;
  late String? name;
  late String? description;
  late String? admin;
  late int? date_debut;
  late int? date_fin;
  late int? duration;
  late int? hizbs;
  late String? repeated;
  late dynamic subscribers;
  late String? status;
  late String? type;
  late int? code;
  late String? username;
  late int? effectif;
  late String? useruid;
  late bool? auto;
  late bool? man;
  late String? doua;

  KhatmaModel({
    this.man,
    this.finished,
    this.doua,
    this.auto,
    this.useruid,
    this.code,
    this.username,
    this.effectif,
    this.id,
    this.key,
    this.name,
    this.description,
    this.admin,
    this.date_debut,
    this.date_fin,
    this.duration,
    this.hizbs,
    this.repeated,
    this.subscribers,
    this.status,
    this.type,
  });

  KhatmaModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    man = map['man'];
    finished = map['finished'];
    doua = map['doua'];
    auto = map['auto'];
    useruid = map['useruid'];
    code = map['code'];
    id = map['id'];
    username = map['username'];
    key = map['key'];
    name = map['name'];
    effectif = map['effectif'];
    description = map['description'];
    admin = map['admin'];
    date_debut = map['date_debut'];
    date_fin = map['date_fin'];
    duration = map['duration'];
    hizbs = map['hizbs'];
    repeated = map['repeated'];
    subscribers = map['subscribers'];
    status = map['status'];
    type = map['type'];
  }

  toJson() {
    return {
      'id': id,
      'key': key ?? "",
      'name': name,
      'username': username,
      'effectif': effectif,
      'description': description,
      'admin': admin,
      'date_debut': date_debut,
      'date_fin': date_fin,
      'duration': duration,
      'hizbs': hizbs,
      'code': code,
      'repeated': repeated,
      'subscribers': subscribers ?? [],
      'status': status,
      'type': type,
      'useruid': useruid,
      "auto": auto,
      'doua': doua,
      'finished': finished,
      "man": man
    };
  }
}
