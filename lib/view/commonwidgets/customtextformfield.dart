import 'package:flutter/material.dart';
import 'package:anomalyreport/core/constant/text_styles.dart';

class CustomTextformfield extends StatelessWidget {
  final String? headingText;
  final String hintText;
  final bool readonly;

  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? valid;
  final void Function(String?)? onSave;
  final void Function()? onTap;
  const CustomTextformfield({
    Key? key,
    this.headingText,
    required this.hintText,
    required this.readonly,
    this.textInputType,
    this.textInputAction,
    this.controller,
    this.onSave,
    this.onTap,
    this.prefixIcon,
    this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsetsDirectional.only(start: 5),
        child: TextFormField(
          validator: valid,
          onSaved: onSave,
          onTap: onTap,
          readOnly: readonly,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: prefixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey),
              )),
        ));
  }
}
