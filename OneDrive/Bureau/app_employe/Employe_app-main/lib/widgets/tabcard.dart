import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_employe/widgets/label.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TabCard extends StatefulWidget {
  final String status;
  final String period;
  final String? type;
  final String? image;
  final String date;
  const TabCard(
      {Key? key,
      required this.status,
      required this.period,
      this.type,
      required this.date,
      this.image})
      : super(key: key);

  @override
  State<TabCard> createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              LabelTxt(
                text: widget.period,
                size: 11,
                color: Colors.grey,
              ),
              SizedBox(
                width: Get.width * 0.35,
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: widget.status == "Declined"
                        ? Colors.red.withOpacity(0.3)
                        : widget.status == "Approuved"
                            ? Colors.green.withOpacity(0.3)
                            : Colors.amber.withOpacity(0.3)
                      ..withOpacity(0.3),
                  ),
                  child: LabelTxt(
                    text: widget.status,
                    size: 11,
                    color: widget.status == "Declined"
                        ? Colors.red
                        : widget.status == "Approuved"
                            ? Colors.green
                            : Colors.amber,
                    fn: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelTxt(text: widget.date, size: 20, fn: FontWeight.w600),
                  widget.type != null
                      ? LabelTxt(
                          text: widget.type!,
                          size: 12,
                          color: widget.type == "  casual  "
                              ? Color(0xff770987)
                              : widget.type == "  sick    "
                                  ? Color(0xff2F58CD)
                                  : widget.type == "  travel  "
                                      ? Color.fromARGB(255, 213, 140, 31)
                                      : Color.fromARGB(255, 47, 205, 121),
                          fn: FontWeight.w600,
                        )
                      : Text(""),
                ],
              ),
              SizedBox(width: Get.width * 0.22),
              widget.image != null
                  ? Image.asset(widget.image.toString(), width: 50, height: 50)
                  : Text(""),
            ],
          )
        ],
      ),
    );
  }
}
