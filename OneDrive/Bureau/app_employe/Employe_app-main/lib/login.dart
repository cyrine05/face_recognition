import 'dart:convert';

import 'package:app_employe/controllers/UserController.dart';
import 'package:app_employe/list_material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:app_employe/widgets/input.dart';
import 'package:app_employe/widgets/label.dart';

class Login extends GetWidget<UserController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  final UserController Usercontroller = Get.put(UserController());

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: const Text(
              "If you forget your password, enter your email and you will receive a new password",
              style: TextStyle(
                color: Color.fromARGB(255, 19, 16, 16),
                fontSize: 20,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic,
              ),
            ),
            content: TextField(
              onChanged: (value) {
                valueText = value;
                ;
              },
              controller: _textFieldController,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                minWidth: 140,
                color: Color.fromARGB(255, 238, 142, 135),
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: Get.height * 0.020),
              MaterialButton(
                minWidth: 150,
                color: Color.fromARGB(255, 82, 138, 84),
                textColor: Colors.white,
                child: const Text('send'),
                onPressed: () {
                  codeDialog = valueText;
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  String? codeDialog;
  String? valueText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.paperPlane,
                        size: 30,
                        color: Color(0Xff4E31AA),
                      ),
                      LabelTxt(
                        text: "|Bee ",
                        size: 20.0,
                      ),
                    ],
                  ),
                  LabelTxt(
                    text: "Sign in ",
                    size: 40.0,
                    fn: FontWeight.w600,
                  ),
                  LabelTxt(
                    text: "Enter your informations and get started",
                    size: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, left: 50, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelTxt(
                          text: "Email*",
                          size: 16.0,
                          color: Colors.grey,
                        ),
                        InputText(
                          hint: 'example@gmail.com',
                          ic: Icons.email,
                          controller: emailController,
                          fct: (value) {
                            if (!GetUtils.isEmail(value!)) {
                              return "Invalid email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: Get.height * 0.005),
                        LabelTxt(
                          text: "Password*",
                          size: 16.0,
                          color: Colors.grey,
                        ),
                        InputText(
                          obscure: true,
                          hint: '********',
                          ic: Icons.key,
                          controller: pwdController,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            _displayTextInputDialog(context);
                          },
                          child: Text('forgot password ?'),
                        ),
                        Center(
                          child: button(
                              width: 250,
                              text: 'Sign in',
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.elliptical(10, 40)
                                          //  bottomLeft:, bottom left
                                          // bottomRight: bottom right
                                          ))),
                              fct: () {
                                Usercontroller.login(
                                    emailController.text, pwdController.text);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
