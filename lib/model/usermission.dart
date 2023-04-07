class UsermissionModel {
  late String? key;
  late String? khatmakey;
  late String? start;
  late String? end;
  late int? startdate;
  late int? enddate;
  late String? user1uid;
  late String? user2uid;
  late int? updatedate;
  late String? partid;
  late String? status;
  late String? khatmaname;
  late bool? finished;
  late String? khatmaadminname;
  late String? khatmaadminmail;
  late int? hizbs;
  late String? fromto;
  late String? reader;
  late String? readeruid;
  late bool? last;
  late bool? retard;
  UsermissionModel({
    this.user1uid,
    this.user2uid,
    this.reader,
    this.last,
    this.readeruid,
    this.finished,
    this.fromto,
    this.hizbs,
    this.updatedate,
    this.khatmaname,
    this.key,
    this.khatmakey,
    this.start,
    this.end,
    this.startdate,
    this.enddate,
    this.partid,
    this.khatmaadminname,
    this.status,
    this.khatmaadminmail,
    this.retard,
  });

  UsermissionModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    user1uid = map["user1uid"];
    user2uid = map["user2uid"];
    reader = map["reader"];
    fromto = map["fromto"];
    hizbs = map["hizbs"];
    key = map["key"];
    khatmakey = map["khatmakey"];
    startdate = map["startdate"];
    enddate = map["enddate"];
    start = map["start"];
    end = map["end"];
    partid = map["partid"];
    khatmaname = map["khatmaname"];
    khatmaadminname = map["khatmaadminname"];
    khatmaadminmail = map["khatmaadminmail"];
    finished = map["finished"];
    updatedate = map["updatedate"];
    status = map["status"];
    enddate = map["enddate"];
    readeruid = map["readeruid"];
    last = map["last"];
    retard = map["retard"];
  }

  toJson() {
    return {
      'readeruid': readeruid,
      'enddate': enddate,
      'key': key,
      'fromto': fromto,
      'khatmakey': khatmakey,
      'startdate': startdate,
      'updatedate': updatedate,
      'start': start,
      'end': end,
      'partid': partid,
      'khatmaname': khatmaname,
      'khatmaadminname': khatmaadminname,
      'khatmaadminmail': khatmaadminmail,
      'finished': finished,
      'status': status,
      'hizbs': hizbs,
      'reader': reader,
      'last': last,
      "user1uid": user1uid,
      "user2uid": user2uid,
      "retard": retard,
    };
  }
}
