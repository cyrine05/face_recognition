import 'package:app_employe/home.dart';
import 'package:app_employe/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'widgets/label.dart';

class Work_hour extends StatefulWidget {
  const Work_hour({super.key});

  @override
  State<Work_hour> createState() => _Work_hourState();
}

class _Work_hourState extends State<Work_hour> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
                body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: BackButton(
                    color: Colors.black,
                    onPressed: () => Get.to(Home()),
                  ),
                  toolbarHeight: 70,
                  backgroundColor: Color.fromARGB(255, 250, 250, 250),
                  automaticallyImplyLeading: false,
                ),
                SliverList(
                    delegate:
                        SliverChildBuilderDelegate((context, index) => Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(children: [
                              Container(
                                width: 800,
                                height: 800,
                                child: SingleChildScrollView(
                                  child: Container(
                                      margin: EdgeInsets.all(24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(height: 20),
                                          LabelTxt(
                                              text: "Work Hours",
                                              size: 30,
                                              fn: FontWeight.w600),
                                          SizedBox(height: 20),
                                          Card(
                                            elevation: 8,
                                            margin: const EdgeInsets.all(10),
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              leading: Icon(Icons.access_time,
                                                  size: 60),
                                              title: LabelTxt(
                                                text: "Start Time",
                                                size: 16,
                                                color: Colors.black,
                                                fn: FontWeight.w600,
                                              ),
                                              subtitle: Text(
                                                "${Usercontroller.user.startTime}",
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 1.0,
                                          ),
                                          Card(
                                            elevation: 8,
                                            margin: const EdgeInsets.all(10),
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              leading: Icon(Icons.timer_off,
                                                  size: 60),
                                              title: LabelTxt(
                                                text: "End Time",
                                                size: 16,
                                                color: Colors.black,
                                                fn: FontWeight.w600,
                                              ),
                                              subtitle: Text(
                                                  '${Usercontroller.user.endTime}'),
                                            ),
                                          ),
                                          Divider(
                                            height: 1.0,
                                          ),
                                          Card(
                                            elevation: 8,
                                            margin: const EdgeInsets.all(10),
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              leading: Icon(
                                                  Icons.breakfast_dining,
                                                  size: 60),
                                              title: LabelTxt(
                                                text: "Break",
                                                size: 16,
                                                color: Colors.black,
                                                fn: FontWeight.w600,
                                              ),
                                              subtitle: Text('12:00:00'),
                                            ),
                                          ),
                                          Divider(
                                            height: 1.0,
                                          ),
                                          Card(
                                            elevation: 8,
                                            margin: const EdgeInsets.all(10),
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              leading: Icon(Icons.lock_clock,
                                                  size: 60),
                                              title: LabelTxt(
                                                text: "Start Time",
                                                size: 16,
                                                color: Colors.black,
                                                fn: FontWeight.w600,
                                              ),
                                              subtitle: Text('12:30:00'),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              )
                            ]))))
              ],
            ))));
  }
}
