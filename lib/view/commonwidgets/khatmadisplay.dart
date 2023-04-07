import 'package:flutter/material.dart';
import 'package:anomalyreport/model/khatmamodel.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:intl/intl.dart';

class KhtamaDisplay extends StatelessWidget {
  final KhatmaModel khtama;
  final String? buttonmsg;
  final Icon? icon;
  final int id;
  final bool enabled;
  final void Function(int)? onpressed;
  const KhtamaDisplay({
    required this.enabled,
    required this.id,
    Key? key,
    required this.khtama,
    this.buttonmsg,
    this.icon,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ExpansionTile(
            title: Text(
              "  أسم الختمة :" + (khtama.name ?? ""),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            subtitle: Text(" وصف الختمة :" + (khtama.description ?? ""),
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
            leading: IconButton(
                onPressed: () {
                  onpressed!(id);
                },
                icon: Icon(Icons.open_in_browser_rounded)),
            children: [
              ListTile(
                leading: Icon(
                  Icons.list_alt_rounded,
                ),
                title: Text(
                  "وصف الختمة ",
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(khtama.description ?? ""),
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
                        khtama.date_debut ?? 0))
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
                        khtama.date_debut ?? 0))
                    .toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.cyclone,
                ),
                title: Text(
                  'دورية الختمة  :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(khtama.repeated ?? ""),
              ),
              ListTile(
                leading: Icon(
                  Icons.numbers_outlined,
                ),
                title: Text(
                  '   عدد الأحزاب لكل مشارك  :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(khtama.hizbs.toString() ?? ""),
              ),
              ListTile(
                leading: Icon(
                  Icons.person_2,
                ),
                title: Text(
                  'مدير  الختمة  :',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(khtama.username ?? ""),
              ),
              SizedBox(
                height: 10,
              ),
              enabled == true
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
                  : SizedBox.shrink(),
              Divider(
                height: 1,
                color: Colors.grey.shade200,
              )
            ]));
  }
}
