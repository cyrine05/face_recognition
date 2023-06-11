import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelTxt extends StatefulWidget {
  final String text;
  final double size;
  final Color? color;
  final IconData? icon;
  final FontWeight? fn;

  const LabelTxt({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.icon,
    this.fn,
    Function()? fct,
  }) : super(key: key);

  @override
  State<LabelTxt> createState() => _LabelTxtState();
}

class _LabelTxtState extends State<LabelTxt> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: widget.size,
        fontWeight: widget.fn,
        fontFamily: 'Poppins',
        color: widget.color,
      )),
    );
  }
}
