import 'package:flutter/material.dart';
import 'package:anomalyreport/core/constant/text_styles.dart';

class CustumDropdown extends StatelessWidget {
  final String hintText;

  final List<String> items;

  final Widget? prefixIcon;

  final TextEditingController? controller;
  final String? Function(String?)? valid;
  final void Function(String?) onchanged;
  final void Function()? onTap;
  const CustumDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    this.controller,
    required this.onchanged,
    this.onTap,
    this.prefixIcon,
    this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: DropdownButtonFormField(
          isExpanded: true,
          icon: prefixIcon,
          hint: Text(hintText),
          disabledHint: Text(hintText),
          onChanged: onchanged,
          items: items.map((String val) {
            return DropdownMenuItem(
              alignment: AlignmentDirectional.centerStart,
              value: val,
              child: Text(
                val,
              ),
            );
          }).toList(),
          validator: valid,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
              )),
        ));
  }
}
