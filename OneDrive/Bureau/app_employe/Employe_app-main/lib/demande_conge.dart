import 'package:app_employe/models/conge.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:app_employe/home.dart';
import 'package:app_employe/list_conges.dart';

import 'package:app_employe/widgets/button.dart';

import 'package:app_employe/widgets/label.dart';

import 'controllers/UserController.dart';
import 'controllers/congecontroller.dart';

class Demande_cong extends StatefulWidget {
  const Demande_cong({Key? key}) : super(key: key);

  @override
  State<Demande_cong> createState() => _Demande_congState();
}

class _Demande_congState extends State<Demande_cong> {
  TextEditingController proofController = TextEditingController();
  TextEditingController causeInputController = TextEditingController();
  TextEditingController startDateInputController = TextEditingController();
  TextEditingController endDateInputController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  final CongeController congeController = Get.put(CongeController());
  final UserController Usercontroller = Get.put(UserController());
  bool isFormValid = false;
  void _updateFormValidity() {
    setState(() {
      isFormValid = causeInputController.text.isNotEmpty &&
          startDateInputController.text.isNotEmpty &&
          endDateInputController.text.isNotEmpty &&
          typeController.text.isNotEmpty;
    });
  }

  String dropdownvalue = '  casual  ';
  var items = [
    '  casual  ',
    '  travel  ',
    '  sick    ',
    '  other   ',
  ];
  List<DateTime?> periode = [];

  File? pickedFile;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickedFile = File(result.files.single.path.toString());
      });
      await Usercontroller.uploadfile(pickedFile!).then((imageUrl) {
        setState(() {
          proofController.text = imageUrl.toString();
          congeController.conge.proof = proofController.text;
          print(congeController.conge.proof.toString());
          print(proofController.text);
        });
      });
    }
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
                BackButton(
                  onPressed: () => Get.to(Home()),
                ),
                LabelTxt(text: "New Leave", size: 40, fn: FontWeight.w600),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 250, 98, 60).withOpacity(0.3)
                      ..withOpacity(0.3),
                  ),
                  child: LabelTxt(
                    // ignore: prefer_interpolation_to_compose_strings
                    text: "Days left:${Usercontroller.user.nbConge}",
                    size: 18,
                    color: Color.fromARGB(255, 165, 54, 40),
                    fn: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.solidRectangleList,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelTxt(
                              text: "type",
                              size: 12,
                              color: Colors.grey,
                            ),
                            DropdownButton(
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                  typeController.text = newValue;
                                });
                                _updateFormValidity();
                              },
                            ),
                          ],
                        )
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.solidPenToSquare,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: 200,
                          height: 100,
                          child: TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: "cause",
                            ),
                            controller: causeInputController,
                            onChanged: (value) => _updateFormValidity(),
                          ),
                        )
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.circleArrowRight,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelTxt(
                              text: "From",
                              size: 12,
                              color: Colors.grey,
                            ),
                            periode.toString().length < 10
                                ? LabelTxt(text: "First Day", size: 18)
                                : LabelTxt(
                                    text: periode.toString().substring(1, 11),
                                    size: 18),
                          ],
                        ),
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      CalendarDatePicker2(
                        value: periode,
                        onValueChanged: (dates) {
                          periode = dates;
                          setState(() {
                            periode = dates;
                          });
                          startDateInputController.text =
                              periode.toString().substring(1, 11);

                          endDateInputController.text =
                              periode.toString().substring(26, 37);

                          _updateFormValidity();
                        },
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                          currentDate: DateTime.now(),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(children: [
                        Icon(
                          FontAwesomeIcons.circleArrowLeft,
                          size: 30,
                          color: Color(0xff3A1078),
                        ),
                        SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelTxt(
                                text: "To",
                                size: 12,
                                color: Colors.grey,
                              ),
                              periode.toString().length < 26
                                  ? LabelTxt(text: "Last Day", size: 18)
                                  : LabelTxt(
                                      text:
                                          periode.toString().substring(26, 37),
                                      size: 18),
                            ]),
                      ]),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Visibility(
                        visible: dropdownvalue == '  sick    ' ? true : false,
                        child: Row(children: [
                          button(
                            width: 100,
                            text: "Proof",
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.elliptical(5, 5)
                                        //  bottomLeft:, bottom left
                                        // bottomRight: bottom right
                                        ))),
                            fct: () {
                              pickFile();
                            },
                          ),
                          SizedBox(width: 15),
                          pickedFile != null
                              ? LabelTxt(
                                  text: pickedFile.toString().substring(
                                        pickedFile.toString().lastIndexOf("/") +
                                            1,
                                      ),
                                  size: 16)
                              : LabelTxt(text: "no file", size: 16),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: button(
                  width: 150,
                  text: "Apply",
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.elliptical(10, 40)
                              //  bottomLeft:, bottom left
                              // bottomRight: bottom right
                              ))),
                  fct: isFormValid
                      ? () {
                          print(proofController.text);
                          congeController.sendData(CongeModel(
                            type: typeController.text,
                            startDate: startDateInputController.text,
                            endDate: endDateInputController.text,
                            proof: congeController.conge.proof.toString(),
                            description: causeInputController.text,
                            state: 'awaiting',
                            idEmploye: Usercontroller.user.id.toString(),
                          ));
                          Get.to(ListConge());
                        }
                      : null,
                ))
              ],
            )),
      ),
    );
  }
}
