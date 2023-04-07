import 'package:flutter/material.dart';
import 'package:anomalyreport/model/khatmamodel.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:intl/intl.dart';

class KhtamaDisplaybis extends StatelessWidget {
  final KhatmaModel khtama;
  final String? buttonmsg;
  final Icon? icon;
  final int id;
  final bool enabled;
  final void Function(int)? onpressed;
  const KhtamaDisplaybis({
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
              " أسم الختمة :" + (khtama.name ?? ""),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            children: [
              ListTile(
                leading: Icon(
                  Icons.menu_book_outlined,
                ),
                title: Text(
                  "إسم الختمة ",
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(khtama.name ?? ""),
              ),
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
              Divider(
                height: 1,
                color: Colors.grey.shade200,
              )
            ]));
  }
}
