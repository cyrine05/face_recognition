import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class InputText extends StatefulWidget {
  final String? hint;
  final IconData? ic;
  final TextEditingController controller;
  final bool? obscure;
  final dynamic fct;
  final dynamic form;
  final String? value;
  final TextInputType? textInputType;
  final FilteringTextInputFormatter? filterTextInputFormatter;
  const InputText({
    Key? key,
    this.hint,
    this.ic,
    required this.controller,
    this.obscure = false,
    this.fct,
    this.value,
    this.textInputType,
    this.filterTextInputFormatter,
    this.form,
  }) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      obscureText: widget.obscure! ? true : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.ic),
        border: const OutlineInputBorder(),
        hintText: widget.hint,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: widget.textInputType,
      validator: widget.fct,
      onChanged: widget.form,
    );
  }
}
