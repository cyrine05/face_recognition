import 'dart:io';
import 'dart:math';

import 'package:app_employe/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:intl/intl.dart';
import 'controllers/UserController.dart';
import 'models/user.dart';
import 'widgets/input.dart';
import 'widgets/label.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

enum Situation { celib, marie }

enum Sexe { male, female }

class _EditState extends State<Edit> {
  File? image;
  final UserController Usercontroller = Get.put(UserController());
  Future<void> _showDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick an image"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Pick image from gallery"),
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                      Get.back();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Take a photo"),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
      await Usercontroller.uploadfile(image!).then((imageUrl) {
        setState(() {
          imagecontroller.text = imageUrl.toString();
          Usercontroller.user.image = imagecontroller.text;
          print(imageUrl.toString());
        });
      });
    }
  }

  late final TextEditingController imagecontroller =
      TextEditingController(text: Usercontroller.user.image.toString());
  late final TextEditingController FirstNameController =
      TextEditingController(text: Usercontroller.user.firstName);
  late final TextEditingController LastNameController =
      TextEditingController(text: Usercontroller.user.lastName);
  late final TextEditingController BirthdateController =
      TextEditingController(text: Usercontroller.user.birthDate);
  late final TextEditingController SituationController =
      TextEditingController(text: Usercontroller.user.situation);
  late final TextEditingController StartTimeController =
      TextEditingController(text: Usercontroller.user.startTime);
  late final TextEditingController EndtimeController =
      TextEditingController(text: Usercontroller.user.endTime);
  late final TextEditingController NbchildController =
      TextEditingController(text: Usercontroller.user.nbEnfants.toString());
  late final TextEditingController EmailController =
      TextEditingController(text: Usercontroller.user.email);
  late final TextEditingController AdressController =
      TextEditingController(text: Usercontroller.user.adress);
  late final TextEditingController Num1Controller =
      TextEditingController(text: Usercontroller.user.phoneNumber1.toString());
  late final TextEditingController Num2Controller =
      TextEditingController(text: Usercontroller.user.phoneNumber2.toString());
  late final TextEditingController SexeController =
      TextEditingController(text: Usercontroller.user.sexe.toString());
  late String? situation = Usercontroller.user.situation.toString();
  late String? sexe = Usercontroller.user.sexe.toString();

  @override
  Widget build(BuildContext context) {
    bool isShow;
    return SafeArea(
        child: DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
              body: CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  title: BackButton(
                    color: Colors.black,
                    onPressed: () => Get.to(Profile()),
                  ),
                  toolbarHeight: 70,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 180.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: image != null
                                      ? FileImage(image!) as ImageProvider
                                      : NetworkImage(Usercontroller.user.image
                                          .toString()) as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Row(children: [
                            SizedBox(height: 280.0, width: 230),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 21.0,
                              child: IconButton(
                                onPressed: () => _showDialog(),
                                icon: Icon(Icons.camera_alt, size: 30),
                              ),
                            )
                          ])
                        ],
                      ),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelTxt(
                                text: "First Name",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              InputText(
                                controller: FirstNameController,
                                ic: FontAwesomeIcons.user,
                                fct: (value) {
                                  if (!(GetUtils.hasMatch(
                                          value, r'^[A-Z][a-z]*$') &&
                                      GetUtils.isLengthLessOrEqual(
                                          value, 20))) {
                                    return "Invalid first name \nthe first name should be like 'Foulen'";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Last Name",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              InputText(
                                controller: LastNameController,
                                ic: FontAwesomeIcons.user,
                                fct: (value) {
                                  if (!(GetUtils.hasMatch(value,
                                          r'^[A-Z][a-z]*( [A-Z][a-z]*)*$') &&
                                      GetUtils.isLengthLessOrEqual(
                                          value, 40))) {
                                    return "Invalid last name \nthe last name should be like 'Foulen' or 'Ben Foulen'";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Birthdate",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Pick a date",
                                  prefixIcon:
                                      Icon(FontAwesomeIcons.solidCalendar),
                                ),
                                controller: BirthdateController,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.parse(
                                          BirthdateController.text),
                                      firstDate: DateTime(1959),
                                      lastDate: DateTime(2002));

                                  if (pickedDate != null) {
                                    BirthdateController.text = pickedDate
                                        .toString()
                                        .substring(0,
                                            pickedDate.toString().indexOf(" "));
                                  }
                                },
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Adress",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              InputText(
                                controller: AdressController,
                                ic: FontAwesomeIcons.house,
                                textInputType: TextInputType.streetAddress,
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Phone number 1 ",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              InputText(
                                controller: Num1Controller,
                                ic: FontAwesomeIcons.phone,
                                textInputType: TextInputType.number,
                                fct: (value) {
                                  if (!(GetUtils.hasMatch(value, "^[95432]") &&
                                      GetUtils.isNumericOnly(value) &&
                                      GetUtils.isLengthEqualTo(value, 8))) {
                                    return "Invalid phone number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "phone number 2 ",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              InputText(
                                controller: Num2Controller,
                                ic: FontAwesomeIcons.phone,
                                textInputType: TextInputType.number,
                                fct: (value) {
                                  if (!(GetUtils.hasMatch(value, "^[95432]") &&
                                      GetUtils.isNumericOnly(value) &&
                                      GetUtils.isLengthEqualTo(value, 8))) {
                                    return "Invalid phone number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Situation :",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              ListTile(
                                  title: const Text('single'),
                                  leading: Radio<String>(
                                    value: "single",
                                    groupValue: situation,
                                    onChanged: (String? value) {
                                      setState(() {
                                        situation = value;
                                      });
                                    },
                                  )),
                              ListTile(
                                  title: const Text('married'),
                                  leading: Radio<String>(
                                    value: "married",
                                    groupValue: situation,
                                    onChanged: (String? value) {
                                      setState(() {
                                        situation = value;
                                      });
                                    },
                                  )),
                              LabelTxt(
                                text: "Sexe :",
                                size: 15.0,
                                color: Colors.grey,
                                icon: Icons.people_alt_sharp,
                              ),
                              SizedBox(height: Get.height * 0.020),
                              ListTile(
                                  title: const Text('male'),
                                  leading: Radio<String>(
                                    value: "male",
                                    groupValue: sexe,
                                    onChanged: (String? value) {
                                      setState(() {
                                        sexe = value;
                                      });
                                    },
                                  )),
                              ListTile(
                                  title: const Text('female'),
                                  leading: Radio<String>(
                                    value: "female",
                                    groupValue: sexe,
                                    onChanged: (String? value) {
                                      setState(() {
                                        sexe = value;
                                      });
                                    },
                                  )),
                              SizedBox(height: Get.height * 0.020),
                              Visibility(
                                visible: situation == 'single' ? false : true,
                                child: Column(
                                  children: [
                                    LabelTxt(
                                      text: "Nbchild",
                                      size: 15.0,
                                      color: Colors.grey,
                                      icon: Icons.child_care_outlined,
                                    ),
                                    SpinBox(
                                      min: 1,
                                      max: 10,
                                      value:
                                          double.parse(NbchildController.text),
                                      onChanged: (value) => NbchildController
                                          .text = value.toString(),
                                    ),
                                    SizedBox(height: Get.height * 0.020),
                                  ],
                                ),
                              ),
                              Center(
                                  child: button(
                                      width: 150,
                                      text: "Apply",
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.elliptical(
                                                      10, 40)))),
                                      fct: () {
                                        print(Usercontroller.user.image
                                            .toString());
                                        Usercontroller.updateData(
                                          Usercontroller.user.id.toString(),
                                          UserModel(
                                              firstName:
                                                  FirstNameController.text,
                                              lastName: LastNameController.text,
                                              birthDate:
                                                  BirthdateController.text,
                                              adress: AdressController.text,
                                              phoneNumber1: int.parse(
                                                  Num1Controller.text),
                                              phoneNumber2: int.parse(
                                                  Num2Controller.text),
                                              image: Usercontroller.user.image
                                                  .toString(),
                                              situation: situation,
                                              sexe: sexe,
                                              nbEnfants: int.parse(
                                                  NbchildController.text
                                                      .substring(0, 1))),
                                        );
                                      })),
                            ]),
                      )
                    ]),
                  ),
                  childCount: 1,
                ))
              ]),
            )));
  }
}
