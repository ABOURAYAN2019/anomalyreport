class PartModel {
  late String? id;
  late String? owermail;
  late String? owername;
  late bool? taked;
  late bool? finished;
  late int? finisheddate;
  late bool? retard;
  late String? observation;
  late String? owermail2;
  late String? owername2;
  late String? start;
  late String? end;
  late String? userid;
  late String? userid2;
  late int? subdate;
  late int? updatedate;
  late String? hizbz;
  late String? fromto;
  late String? reader;
  late int? enddate;
  late int? idnbr;
  late bool? islast;
  late String? readeruid;

  PartModel({
    this.islast,
    this.idnbr,
    this.enddate,
    this.userid2,
    this.reader,
    this.readeruid,
    this.fromto,
    this.hizbz,
    this.id,
    this.userid,
    this.owermail,
    this.owername,
    this.taked,
    this.finished,
    this.finisheddate,
    this.retard,
    this.observation,
    this.owermail2,
    this.owername2,
    this.start,
    this.end,
    this.subdate,
    this.updatedate,
  });

  PartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    readeruid = map["readeruid"];
    islast = map["islast"];
    userid2 = map["userid2"];
    reader = map["reader"];
    id = map["id"];
    fromto = map["fromto"];
    userid = map["userid"];
    owermail = map["owermail"];
    owername = map["owername"];
    taked = map["taked"];
    finished = map["finished"];
    enddate = map["enddate"];
    idnbr = map["idnbr"];
    finisheddate = map["finisheddate"];
    retard = map["retard"];
    observation = map["observation"];
    owermail2 = map["owermail2"];
    owername2 = map["owername2"];
    start = map["start"];
    end = map["end"];
    hizbz = map["hizbz"];
    subdate = map["subdate"];
    updatedate = map["updatedate"];
  }

  toJson() {
    return {
      "reader": reader,
      "hizbz": hizbz,
      "id": id,
      "idnbr": idnbr,
      "owermail": owermail,
      "owername": owername,
      "taked": taked,
      "finished": finished,
      "finisheddate": finisheddate,
      "retard": retard,
      "observation": observation,
      "owermail2": owermail2,
      "owername2": owername2,
      "start": start,
      "end": end,
      "subdate": subdate,
      "userid": userid,
      "userid2": userid2,
      "updatedate": updatedate,
      "fromto": fromto,
      'enddate': enddate,
      'islast': islast,
      'readeruid': readeruid,
    };
  }
}
