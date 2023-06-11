import 'package:app_employe/home.dart';
import 'package:app_employe/models/conge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/demande_conge.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:intl/intl.dart';
import 'package:app_employe/widgets/tabcard.dart';

import 'controllers/congecontroller.dart';

class ListConge extends StatefulWidget {
  const ListConge({super.key});

  @override
  State<ListConge> createState() => _ListCongeState();
}

duration(String date1, String date2) {
  DateTime dt1 = DateTime.parse(date1);
  print(dt1);
  DateTime dt2 = DateTime.parse(date2);
  print(dt2.difference(dt1).inDays);
  return dt2.difference(dt1).inDays + 1;
}

final CongeController congeController = Get.put(CongeController());

class _ListCongeState extends State<ListConge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (congeController.conges.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return DefaultTabController(
            initialIndex: 0,
            length: 5,
            child: Scaffold(
                body: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                title: BackButton(
                  color: Colors.black,
                  onPressed: () => Get.to(Home()),
                ),
                actions: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(Demande_cong());
                          },
                          icon: Icon(FontAwesomeIcons.solidSquarePlus,
                              color: Color(0xff3A1078), size: 45)),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelTxt(
                          text: "Leaves ",
                          size: 40.0,
                          fn: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(10), // Creates border
                                color: Color(0xffCBC0D3)),
                            tabs: [
                              Tab(
                                child: LabelTxt(
                                  text: "All",
                                  size: 16,
                                  color: Colors.black,
                                  fn: FontWeight.w600,
                                ),
                              ),
                              Tab(
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color(0xff770987),
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    LabelTxt(
                                      text: "Casual",
                                      size: 16,
                                      color: Colors.black,
                                      fn: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color(0xff2F58CD),
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    LabelTxt(
                                      text: "Sick",
                                      size: 16,
                                      color: Colors.black,
                                      fn: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color.fromARGB(255, 213, 140, 31),
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    LabelTxt(
                                      text: "travel",
                                      size: 16,
                                      color: Colors.black,
                                      fn: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color.fromARGB(255, 47, 205, 121),
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    LabelTxt(
                                      text: "Other",
                                      size: 16,
                                      color: Colors.black,
                                      fn: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2000,
                          width: 500,
                          child: TabBarView(
                            physics: ScrollPhysics(),
                            viewportFraction: 1.0,
                            children: <Widget>[
                              Column(
                                children: [
                                  for (var c in congeController.conges)
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TabCard(
                                            status: c.state.toString(),
                                            period: duration(
                                                        c.startDate.toString(),
                                                        c.endDate.toString())
                                                    .toString() +
                                                " days application",
                                            type: c.type.toString(),
                                            date: DateFormat.yMMMEd().format(
                                                DateTime.parse(
                                                    c.startDate.toString()))),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                ],
                              ),
                              Column(
                                children: congeController.conges
                                        .any((c) => c.type == "  casual  ")
                                    ? congeController.conges
                                        .where((c) => c.type == "  casual  ")
                                        .map((c) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                    status: c.state.toString(),
                                                    period: duration(
                                                                c.startDate
                                                                    .toString(),
                                                                c.endDate
                                                                    .toString())
                                                            .toString() +
                                                        " days application",
                                                    type: c.type.toString(),
                                                    date: DateFormat.yMMMEd()
                                                        .format(DateTime.parse(c
                                                            .startDate
                                                            .toString()))),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: congeController.conges
                                        .any((c) => c.type == "  sick    ")
                                    ? congeController.conges
                                        .where((c) => c.type == "  sick    ")
                                        .map((c) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                    status: c.state.toString(),
                                                    period: duration(
                                                                c.startDate
                                                                    .toString(),
                                                                c.endDate
                                                                    .toString())
                                                            .toString() +
                                                        " days application",
                                                    type: c.type.toString(),
                                                    date: DateFormat.yMMMEd()
                                                        .format(DateTime.parse(c
                                                            .startDate
                                                            .toString()))),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: congeController.conges
                                        .any((c) => c.type == "  travel  ")
                                    ? congeController.conges
                                        .where((c) => c.type == "  travel  ")
                                        .map((c) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                    status: c.state.toString(),
                                                    period: duration(
                                                                c.startDate
                                                                    .toString(),
                                                                c.endDate
                                                                    .toString())
                                                            .toString() +
                                                        " days application",
                                                    type: c.type.toString(),
                                                    date: DateFormat.yMMMEd()
                                                        .format(DateTime.parse(c
                                                            .startDate
                                                            .toString()))),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: congeController.conges
                                        .any((c) => c.type == "  other   ")
                                    ? congeController.conges
                                        .where((c) => c.type == "  other   ")
                                        .map((c) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                    status: c.state.toString(),
                                                    period: duration(
                                                                c.startDate
                                                                    .toString(),
                                                                c.endDate
                                                                    .toString())
                                                            .toString() +
                                                        " days application",
                                                    type: c.type.toString(),
                                                    date: DateFormat.yMMMEd()
                                                        .format(DateTime.parse(c
                                                            .startDate
                                                            .toString()))),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  childCount: 1,
                ),
              )
            ])),
          );
        }
      }),
    );
  }
}
