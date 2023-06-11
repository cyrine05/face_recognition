import 'package:app_employe/settings.dart';
import 'package:app_employe/widgets/button.dart';
import 'package:app_employe/edit.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:get/get.dart';

import 'controllers/UserController.dart';
import 'home.dart';
import 'login.dart';
import 'widgets/profileListItem.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final UserController Usercontroller = Get.put(UserController());

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackButton(
                color: Colors.black,
                onPressed: () => Get.to(Home()),
              ),
              SizedBox(
                height: 100,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          child: Align(
                            alignment: Alignment.bottomRight,
                          ),
                          radius: 60.0,
                          backgroundImage: NetworkImage(
                              Usercontroller.user.image.toString()),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    LabelTxt(
                      text: "${Usercontroller.user.firstName.toString()} "
                          " ${Usercontroller.user.lastName.toString()}",
                      size: 20,
                      fn: FontWeight.w600,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(width: 45),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: FontAwesomeIcons.pen,
                  text: 'Edit profil',
                  hasNavigation: false,
                  fct: () => Get.to(Edit()),
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.cog,
                  text: 'Settings',
                  fct: () => Get.to(Settings()),
                  hasNavigation: false,
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.doorOpen,
                  text: 'Logout',
                  hasNavigation: false,
                  fct: () => Usercontroller.logout(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
