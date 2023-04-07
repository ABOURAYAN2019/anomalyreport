import 'package:flutter/material.dart';
import 'package:anomalyreport/model/khatmamodel.dart';
import 'package:anomalyreport/model/usermission.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:intl/intl.dart';

class Missiondisplay extends StatelessWidget {
  final UsermissionModel mission;
  final String? buttonmsg;
  final Icon? icon;
  final int id;

  final void Function(int)? onpressed;
  final void Function(String)? record;

  final void Function(int)? onpressedquit;
  const Missiondisplay({
    this.record,
    this.onpressedquit,
    required this.id,
    Key? key,
    required this.mission,
    this.buttonmsg,
    this.icon,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ExpansionTile(
            title: Text("أسم الختمة :" + (mission.khatmaname ?? ""),
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            subtitle: Text(" المهمة :" + (mission.fromto ?? ""),
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            leading: mission.finished != true
                ? IconButton(
                    onPressed: () {
                      onpressed!(id);
                    },
                    icon: Icon(Icons.check),
                    color: Colors.green,
                  )
                : Text(
                    "منتهية",
                    style: TextStyle(fontSize: 10, color: Colors.lightGreen),
                  ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.menu_book_outlined,
                ),
                title: Text(
                  "ختمتي  : ",
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(mission.khatmaname ?? ""),
              ),
              ListTile(
                leading: Icon(
                  Icons.list_alt_rounded,
                ),
                title: Text(
                  "مهمتي  :",
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(
                  mission.fromto ?? "",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.date_range_sharp,
                ),
                title: Text(
                  'تاريخ الإنطلاق : ',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(DateFormat('yyyy-MM-dd')
                    .format(DateTime.fromMicrosecondsSinceEpoch(
                        mission.startdate ?? 0))
                    .toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.date_range_sharp,
                ),
                title: Text(
                  'تاريخ الإنتهاء  :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(DateFormat('yyyy-MM-dd')
                    .format(DateTime.fromMicrosecondsSinceEpoch(
                        mission.enddate ?? 0))
                    .toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.ac_unit,
                ),
                title: Text(
                  'عدد الأحزاب بالمهمة  :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(mission.hizbs.toString() ?? ""),
              ),
              ListTile(
                leading: Icon(
                  Icons.cyclone,
                ),
                title: Text(
                  'الحالة   :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(mission.status ?? ""),
              ),
              ListTile(
                leading: Icon(
                  Icons.person_2,
                ),
                title: Text(
                  'مدير  الختمة  :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(mission.khatmaadminname ?? ""),
              ),
              mission.finished == true
                  ? ListTile(
                      leading: Icon(
                        Icons.read_more,
                      ),
                      title: Text(
                        'القارئ  :',
                        style: TextStyle(color: Colors.grey),
                      ),
                      subtitle: Text(mission.reader ?? ""),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 10,
              ),
              mission.finished != true
                  ? CustomButton(
                      onpressed: () {
                        onpressed!(id);
                      },
                      backgroundColor: Colors.amber,
                      captiontext: buttonmsg,
                      txtcolor: Colors.black,
                      icon: Icon(
                        Icons.login_outlined,
                        size: 20,
                      ),
                    )
                  : Text(
                      "مهمة منتهية",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green),
                    ),
              SizedBox(
                height: 10,
              ),
              mission.finished != true
                  ? CustomButton(
                      onpressed: () {
                        onpressedquit!(id);
                      },
                      backgroundColor: Colors.amber,
                      captiontext: 'الإنسحاب من الختمة',
                      txtcolor: Colors.black,
                      icon: Icon(
                        Icons.leave_bags_at_home,
                        size: 20,
                      ),
                    )
                  : SizedBox.shrink(),
              mission.last == true
                  ? CustomButton(
                      onpressed: () {
                        record!(mission.khatmakey!);
                      },
                      backgroundColor: Colors.red,
                      captiontext: 'تسجيل دعاء الختم',
                      txtcolor: Colors.black,
                      icon: Icon(
                        Icons.mic_external_on,
                        size: 20,
                      ),
                    )
                  : SizedBox.shrink(),
              Divider(
                height: 1,
                color: Colors.grey.shade200,
              )
            ]));
  }
}
