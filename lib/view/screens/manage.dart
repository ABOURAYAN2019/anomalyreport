import 'package:flutter/material.dart';
import 'package:anomalyreport/controller/add_controller.dart';
import 'package:anomalyreport/controller/admin_controller.dart';
import 'package:anomalyreport/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:anomalyreport/model/anomalymodel.dart';
import 'package:anomalyreport/view/commonwidgets/custom_text_form_multiline.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:anomalyreport/view/commonwidgets/customslider.dart';
import 'package:anomalyreport/view/commonwidgets/customtextformfield.dart';
import 'package:anomalyreport/view/commonwidgets/dropdown_form_field.dart';

class Manage extends StatelessWidget {
  Manage({Key? key}) : super(key: key);

  final controller = Get.put(
    AdminController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(3.0),
        child: Card(
            elevation: 5,
            child: GetBuilder<AdminController>(
                builder: (controller) => controller.loading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          value: 40,
                          color: Colors.amber,
                        ),
                      )
                    : ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            title: Text(controller.resulttype),
                            tileColor: Colors.amber.shade100,
                            trailing: IconButton(
                                onPressed: () {
                                  controller.addhelper();
                                },
                                icon: Icon(
                                  Icons.search,
                                  size: 35,
                                )),
                          ),
                          ListView.builder(
                              itemCount: controller.anomalies.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ExpansionTile(
                                  title: Text(
                                      controller.anomalies[index].emplacement ??
                                          ""),
                                  subtitle: Text(
                                      controller.anomalies[index].description ??
                                          ""),
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.date_range_sharp,
                                      ),
                                      title: Text(
                                        'Date : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      subtitle: Text(DateFormat('yyyy-MM-dd')
                                          .format(DateTime
                                              .fromMicrosecondsSinceEpoch(
                                                  controller.anomalies[index]
                                                          .date ??
                                                      0))
                                          .toString()),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.person_2,
                                      ),
                                      title: Text(
                                        'Utilisateur : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      subtitle: Text(
                                        (controller.anomalies[index].user ??
                                            ""),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.check_circle,
                                      ),
                                      title: Text(
                                        'Status : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      subtitle: Text(
                                          (controller.anomalies[index].status ??
                                              "")),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.tab_sharp,
                                      ),
                                      title: Text(
                                        'Type : ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      subtitle: Text(
                                          (controller.anomalies[index].type ??
                                              "")),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    controller.anomalies[index].image != ""
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 50),
                                            child: Image.network(
                                                controller.anomalies[index]
                                                        .image ??
                                                    "",
                                                height: 300,
                                                fit: BoxFit.fill))
                                        : SizedBox.shrink(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    (controller.anomalies[index].status ==
                                                "En_cours" &&
                                            controller.isadmin == true)
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            width: double.infinity,
                                            child: ElevatedButton.icon(
                                                onPressed: () {
                                                  controller.terminateitem(
                                                      controller
                                                          .anomalies[index]);
                                                },
                                                icon: Icon(Icons.close),
                                                label: Text("Terminer")),
                                          )
                                        : SizedBox.shrink(),
                                    (controller.anomalies[index].status ==
                                                "En_cours" &&
                                            controller.isadmin == true)
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            width: double.infinity,
                                            child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.red.shade300,
                                                ),
                                                onPressed: () {
                                                  controller.cancelitem(
                                                      controller
                                                          .anomalies[index]);
                                                },
                                                icon: Icon(Icons.close),
                                                label: Text("Annuler")),
                                          )
                                        : SizedBox.shrink(),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              })
                        ],
                      ))));
  }
}
