import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/widgets/label.dart';

import '../demande_conge.dart';

class card extends StatefulWidget {
  final String text;
  final dynamic page;
  final Color startcolor;
  final Color endcolor;
  final IconData icon;
  const card(
      {Key? key,
      required this.text,
      this.page,
      required this.startcolor,
      required this.endcolor,
      required this.icon})
      : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
              colors: [widget.startcolor, widget.endcolor])),
      child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: InkWell(
            onTap: () => Get.to(widget.page),
            child: Container(
                width: 100,
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        widget.icon,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: Get.height * 0.05),
                      LabelTxt(
                          text: widget.text, size: 20.0, color: Colors.white)
                    ],
                  ),
                )),
          )),
    );
  }
}
