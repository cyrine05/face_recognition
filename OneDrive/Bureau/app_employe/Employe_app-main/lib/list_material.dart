import 'package:app_employe/demande_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/demande_conge.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:intl/intl.dart';
import 'package:app_employe/widgets/tabcard.dart';

import 'controllers/materialcontroller.dart';
import 'home.dart';

class ListMaterial extends StatefulWidget {
  const ListMaterial({super.key});

  @override
  State<ListMaterial> createState() => _ListMaterialState();
}

final MaterialController materialController = Get.put(MaterialController());

class _ListMaterialState extends State<ListMaterial> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (materialController.material.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return DefaultTabController(
            initialIndex: 1,
            length: 7,
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
                            Get.to(Demande_mat());
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
                          text: "Material ",
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
                                child: Image.asset(
                                  "assets/image/needle.png",
                                  color: Color(0xff770987),
                                  width: 50,
                                  height: 30,
                                ),
                              ),
                              Tab(
                                child: Image.asset(
                                  "assets/image/sewingMachine.png",
                                  color: Color(0xff3A1078),
                                  width: 50,
                                  height: 30,
                                ),
                              ),
                              Tab(
                                child: Image.asset(
                                  "assets/image/knitting.png",
                                  color: Color(0xff2F58CD),
                                  width: 50,
                                  height: 30,
                                ),
                              ),
                              Tab(
                                child: Image.asset(
                                  "assets/image/button.png",
                                  color: Color.fromARGB(255, 96, 1, 101),
                                  width: 50,
                                  height: 30,
                                ),
                              ),
                              Tab(
                                child: Image.asset(
                                  "assets/image/scissor.png",
                                  color: Color.fromARGB(255, 19, 2, 129),
                                  width: 50,
                                  height: 30,
                                ),
                              ),
                              Tab(
                                child: Image.asset(
                                  "assets/image/fabric.png",
                                  color: Color.fromARGB(255, 106, 6, 49),
                                  width: 50,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2000,
                          width: 500,
                          child: TabBarView(
                            viewportFraction: 1.0,
                            children: <Widget>[
                              Column(
                                children: [
                                  for (var m in materialController.material)
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TabCard(
                                          status: m.state.toString(),
                                          period: "quantity needed :  " +
                                              m.quantity.toString(),
                                          date: DateFormat.yMMMEd().format(
                                              DateTime.parse(
                                                  m.date.toString())),
                                          image: "assets/image/" +
                                              m.type.toString() +
                                              ".png",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                ],
                              ),
                              Column(
                                children: materialController.material
                                        .any((m) => m.type == "needle")
                                    ? materialController.material
                                        .where((m) => m.type == "needle")
                                        .map((m) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                  status: m.state.toString(),
                                                  period: "quantity needed :" +
                                                      m.quantity.toString(),
                                                  date: DateFormat.yMMMEd()
                                                      .format(DateTime.parse(
                                                          m.date.toString())),
                                                  image: "assets/image/" +
                                                      m.type.toString() +
                                                      ".png",
                                                ),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: materialController.material
                                        .any((m) => m.type == "sewingMachine")
                                    ? materialController.material
                                        .where((m) => m.type == "sewingMachine")
                                        .map((m) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                  status: m.state.toString(),
                                                  period:
                                                      "quantity needed :  " +
                                                          m.quantity.toString(),
                                                  date: DateFormat.yMMMEd()
                                                      .format(DateTime.parse(
                                                          m.date.toString())),
                                                  image: "assets/image/" +
                                                      m.type.toString() +
                                                      ".png",
                                                ),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: materialController.material
                                        .any((m) => m.type == "knitting")
                                    ? materialController.material
                                        .where((m) => m.type == "knitting")
                                        .map((m) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                  status: m.state.toString(),
                                                  period:
                                                      "quantity needed :  " +
                                                          m.quantity.toString(),
                                                  date: DateFormat.yMMMEd()
                                                      .format(DateTime.parse(
                                                          m.date.toString())),
                                                  image: "assets/image/" +
                                                      m.type.toString() +
                                                      ".png",
                                                ),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: materialController.material
                                        .any((m) => m.type == "button")
                                    ? materialController.material
                                        .where((m) => m.type == "button")
                                        .map((m) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                  status: m.state.toString(),
                                                  period:
                                                      "quantity needed :  " +
                                                          m.quantity.toString(),
                                                  date: DateFormat.yMMMEd()
                                                      .format(DateTime.parse(
                                                          m.date.toString())),
                                                  image: "assets/image/" +
                                                      m.type.toString() +
                                                      ".png",
                                                ),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: materialController.material
                                        .any((m) => m.type == "scissor")
                                    ? materialController.material
                                        .where((m) => m.type == "scissor")
                                        .map((m) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                  status: m.state.toString(),
                                                  period:
                                                      "quantity needed :  " +
                                                          m.quantity.toString(),
                                                  date: DateFormat.yMMMEd()
                                                      .format(DateTime.parse(
                                                          m.date.toString())),
                                                  image: "assets/image/" +
                                                      m.type.toString() +
                                                      ".png",
                                                ),
                                              ],
                                            ))
                                        .toList()
                                    : [
                                        LabelTxt(
                                            text: "no requests here", size: 16),
                                      ],
                              ),
                              Column(
                                children: materialController.material
                                        .any((m) => m.type == "fabric")
                                    ? materialController.material
                                        .where((m) => m.type == "fabric")
                                        .map((m) => Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TabCard(
                                                  status: m.state.toString(),
                                                  period:
                                                      "quantity needed :  " +
                                                          m.quantity.toString(),
                                                  date: DateFormat.yMMMEd()
                                                      .format(DateTime.parse(
                                                          m.date.toString())),
                                                  image: "assets/image/" +
                                                      m.type.toString() +
                                                      ".png",
                                                ),
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
