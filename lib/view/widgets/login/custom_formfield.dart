import 'package:flutter/material.dart';
import 'package:anomalyreport/core/constant/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String?) valid;
  final int maxLines;
  final Function? onSave;

  const CustomFormField(
      {Key? key,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.textInputType,
      required this.textInputAction,
      this.controller,
      this.onSave,
      this.prefixIcon,
      required this.valid,
      required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            maxLines: maxLines,
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            obscureText: obsecureText,
            validator: valid,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                prefixIcon: prefixIcon,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                hintStyle: KTextStyle.textFieldHintStyle,
                label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    child: Text(headingText)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
}
