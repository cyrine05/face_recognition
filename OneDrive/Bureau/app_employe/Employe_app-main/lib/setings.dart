import 'package:app_employe/profile.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:app_employe/widgets/input.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Setings extends StatefulWidget {
  const Setings({super.key});

  @override
  State<Setings> createState() => _SetingsState();
}

class _SetingsState extends State<Setings> {
  final TextEditingController pwd1Controller = TextEditingController();
  final TextEditingController pwd2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackButton(),
                LabelTxt(
                  text: "Change Password ",
                  size: 30.0,
                  fn: FontWeight.w500,
                ),
                Container(
                  margin: EdgeInsets.only(right: 50, left: 50, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelTxt(
                        text: "Your Actuel password",
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      InputText(
                        obscure: true,
                        hint: '********',
                        ic: Icons.key,
                        controller: pwd1Controller,
                      ),
                      SizedBox(height: Get.height * 0.030),
                      LabelTxt(
                        text: "Your New Password*",
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      InputText(
                        obscure: true,
                        hint: '********',
                        ic: Icons.key,
                        controller: pwd2Controller,
                      ),
                      SizedBox(height: Get.height * 0.0300),
                      Center(
                        child: button(
                            width: 250,
                            text: 'Apply',
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.elliptical(10, 40)
                                        //  bottomLeft:, bottom left
                                        // bottomRight: bottom right
                                        ))),
                            fct: () {
                              setState(() {
                                Profile();
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
