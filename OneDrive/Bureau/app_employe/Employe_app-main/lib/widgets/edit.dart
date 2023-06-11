import 'dart:io';

import 'package:app_employe/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:intl/intl.dart';
import 'input.dart';
import 'label.dart';
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
  File? _image;

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
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Take a photo"),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
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
        _image = File(pickedImage.path);
      });
    }
  }

  final TextEditingController pwdController = TextEditingController();
  final TextEditingController FirstNameController = TextEditingController();
  final TextEditingController LastNameController = TextEditingController();
  final TextEditingController BirthdateController = TextEditingController();
  final TextEditingController SituationController = TextEditingController();
  final TextEditingController SatrtTimeController = TextEditingController();
  final TextEditingController EndtimeController = TextEditingController();
  final TextEditingController NbchildController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController AdressController = TextEditingController();
  final TextEditingController Num1Controller = TextEditingController();
  final TextEditingController Num2Controller = TextEditingController();
  final TextEditingController SexeController = TextEditingController();
  Situation? _situation = Situation.celib;
  Sexe? _sexe = Sexe.male;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
              body: CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  title: BackButton(
                    color: Colors.black,
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
                                  image: _image != null
                                      ? FileImage(_image!) as ImageProvider
                                      : const AssetImage(
                                              'assets/image/nedra.jpg')
                                          as ImageProvider,
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
                                size: 10.0,
                                color: Colors.grey,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_sharp),
                                  hintText: "First Name",
                                ),
                                controller: FirstNameController,
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Last Name",
                                size: 10.0,
                                color: Colors.grey,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_sharp),
                                  hintText: "Last Name",
                                ),
                                controller: LastNameController,
                              ),
                              SizedBox(height: Get.height * 0.020),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Pick a date",
                                  prefixIcon: Icon(Icons.calendar_month),
                                ),
                                controller: BirthdateController,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2050));

                                  if (pickedDate != null) {
                                    BirthdateController.text =
                                        pickedDate.toString();
                                  }
                                },
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "adress",
                                size: 10.0,
                                color: Colors.grey,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.home),
                                  hintText: "Adress",
                                ),
                                controller: AdressController,
                              ),
                              SizedBox(height: Get.height * 0.020),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: "Num1",
                                ),
                                controller: Num1Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              SizedBox(height: Get.height * 0.020),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: "Num2",
                                ),
                                controller: Num2Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Password*",
                                size: 10.0,
                                color: Colors.grey,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key),
                                  hintText: '********',
                                ),
                                controller: pwdController,
                                obscureText: true,
                              ),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Situation :",
                                size: 15.0,
                                color: Colors.grey,
                              ),
                              ListTile(
                                  title: const Text('celib'),
                                  leading: Radio<Situation>(
                                    value: Situation.celib,
                                    groupValue: _situation,
                                    onChanged: (Situation? value) {
                                      setState(() {
                                        _situation = value;
                                      });
                                    },
                                  )),
                              ListTile(
                                  title: const Text('marie'),
                                  leading: Radio<Situation>(
                                    value: Situation.marie,
                                    groupValue: _situation,
                                    onChanged: (Situation? value) {
                                      setState(() {
                                        _situation = value;
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
                                  leading: Radio<Sexe>(
                                    value: Sexe.male,
                                    groupValue: _sexe,
                                    onChanged: (Sexe? value) {
                                      setState(() {
                                        _sexe = value;
                                      });
                                    },
                                  )),
                              ListTile(
                                  title: const Text('female'),
                                  leading: Radio<Sexe>(
                                    value: Sexe.female,
                                    groupValue: _sexe,
                                    onChanged: (Sexe? value) {
                                      setState(() {
                                        _sexe = value;
                                      });
                                    },
                                  )),
                              SizedBox(height: Get.height * 0.020),
                              LabelTxt(
                                text: "Nbchild",
                                size: 10.0,
                                color: Colors.grey,
                                icon: Icons.child_care_outlined,
                              ),
                              SpinBox(
                                min: 1,
                                max: 10,
                                value: 0,
                                onChanged: (NbchildController) =>
                                    print(NbchildController),
                              ),
                              SizedBox(height: Get.height * 0.020),
                              Center(
                                  child: button(
                                      width: 150,
                                      text: "Apply",
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.elliptical(10, 40)
                                                  //  bottomLeft:, bottom left
                                                  // bottomRight: bottom right
                                                  ))),
                                      fct: () => Get.to(Profile()))),
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
