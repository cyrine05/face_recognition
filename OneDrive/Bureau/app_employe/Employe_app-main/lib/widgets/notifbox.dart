import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationBox extends StatelessWidget {
  NotificationBox({Key? key, this.onTap, this.notifiedNumber = 0})
      : super(key: key);
  final GestureTapCallback? onTap;
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black12,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0
            ? badges.Badge(
                badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Color.fromARGB(255, 244, 16, 0),
                    padding: EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(4)),
                position: BadgePosition.topEnd(top: -2, end: 1),
                child: Icon(
                  FontAwesomeIcons.bell,
                  size: 27,
                  color: Colors.black,
                ),
              )
            : Icon(
                FontAwesomeIcons.solidBell,
                size: 25,
              ),
      ),
    );
  }
}
