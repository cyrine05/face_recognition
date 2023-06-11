import 'package:app_employe/events.dart';
import 'package:app_employe/reclamation.dart';
import 'package:app_employe/workhour.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_employe/demande_conge.dart';
import 'package:app_employe/demande_materials.dart';
import 'package:app_employe/widgets/card.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:get/get.dart';

import 'controllers/UserController.dart';
import 'notifications.dart';
import 'widgets/notifbox.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

final UserController Usercontroller = Get.put(UserController());

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipOval(
                            child: Image.network(
                                Usercontroller.user.image.toString()),
                          ))),
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LabelTxt(
                          text:
                              "Hi ${Usercontroller.user.firstName.toString().capitalizeFirst} ,",
                          size: 20,
                          fn: FontWeight.w600,
                          color: Colors.black,
                        ),
                        LabelTxt(
                            text: "a good day for work",
                            size: 14.0,
                            color: Colors.black)
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  children: [
                    NotificationBox(
                      notifiedNumber: 3,
                      onTap: () {
                        Get.to(Notifis());
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children: <Widget>[
                          card(
                            text: "Request material",
                            startcolor: Color(0xff2F58CD),
                            endcolor: Color(0xff3795BD),
                            icon: FontAwesomeIcons.boxOpen,
                            page: Demande_mat(),
                          ),
                          card(
                            text: "Work Hours",
                            startcolor: Color(0xff3A1078),
                            endcolor: Color(0xff542CA5),
                            icon: FontAwesomeIcons.businessTime,
                            page: Work_hour(),
                          ),
                          card(
                              text: "Request time off",
                              startcolor: Color(0xff3A1078),
                              endcolor: Color(0xff770987),
                              icon: FontAwesomeIcons.calendarCheck,
                              page: Demande_cong()),
                          card(
                            text: "Events/Meetings",
                            startcolor: Color(0xff770987),
                            endcolor: Color(0xff2F58CD),
                            icon: FontAwesomeIcons.handshake,
                            page: Calendrier(),
                          ),
                          card(
                            text: "Reclamation",
                            startcolor: Color(0xff2F58CD),
                            endcolor: Color(0xff3795BD),
                            icon: FontAwesomeIcons.filePen,
                            page: Reclamation(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
