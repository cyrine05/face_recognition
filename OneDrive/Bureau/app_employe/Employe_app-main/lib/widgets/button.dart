import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:app_employe/widgets/label.dart';

class button extends StatefulWidget {
  final String text;
  final dynamic fct;
  final double width;
  const button(
      {Key? key,
      required this.text,
      this.fct,
      required this.width,
      required ButtonStyle style})
      : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 50,
      child: GlowButton(
          onPressed: widget.fct,
          color: Color(0Xff4E31AA),
          child: LabelTxt(
            text: widget.text,
            size: 20.0,
            fn: FontWeight.w600,
            color: Colors.white,
          )),
    );
  }
}
