import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controllers/UserController.dart';
import 'controllers/reclamationcontroller.dart';
import 'home.dart';
import 'models/reclamation.dart';
import 'widgets/button.dart';
import 'widgets/label.dart';

class Reclamation extends StatefulWidget {
  const Reclamation({super.key});

  @override
  State<Reclamation> createState() => _ReclamationState();
}

class _ReclamationState extends State<Reclamation> {
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final UserController Usercontroller = Get.put(UserController());
  final ReclamationController reclamationController =
      Get.put(ReclamationController());
  bool isFormValid = false;
  void _updateFormValidity() {
    setState(() {
      isFormValid = topicController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackButton(),
                LabelTxt(text: "Reclamation", size: 30, fn: FontWeight.w600),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: <Widget>[
                        Row(children: [
                          Icon(
                            FontAwesomeIcons.diagramNext,
                            size: 30,
                            color: Color(0xff3A1078),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelTxt(
                                text: "Topic ",
                                size: 12,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 280,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                        "what's the topic of your reclamation?",
                                  ),
                                  controller: topicController,
                                  onChanged: (value) => _updateFormValidity(),
                                ),
                              ),
                            ],
                          )
                        ]),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidPenToSquare,
                                size: 30,
                                color: Color(0xff3A1078),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelTxt(
                                    text: "Cause",
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 280,
                                    height: 200,
                                    child: TextField(
                                      maxLines: 8,
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Description.......",
                                      ),
                                      controller: descriptionController,
                                      onChanged: (value) =>
                                          _updateFormValidity(),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: button(
                  width: 150,
                  text: "Send",
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.elliptical(10, 40)))),
                  fct: isFormValid
                      ? () {
                          reclamationController.sendData(ReclamationModel(
                            topic: topicController.text,
                            description: descriptionController.text,
                            idEmploye: Usercontroller.user.id.toString(),
                          ));
                        }
                      : null,
                ))
              ],
            )),
      ),
    );
  }
}
