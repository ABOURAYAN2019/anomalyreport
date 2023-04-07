import 'package:flutter/material.dart';

class Autocompleteformfield extends StatelessWidget {
  final Iterable<String> suggestons;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? valid;
  final void Function(String?)? onselect;

  const Autocompleteformfield({
    Key? key,
    this.controller,
    this.valid,
    required this.suggestons,
    this.onselect,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Autocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            } else {
              List<String> matches = <String>[];
              matches.addAll(suggestons);

              matches.retainWhere((s) {
                return s
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
              return matches;
            }
          },
          onSelected: onselect,
          fieldViewBuilder: (BuildContext context, controller,
              FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
            return TextFormField(
              validator: valid,
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
              controller: controller,
              focusNode: fieldFocusNode,
              style: const TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: 'roboto'),
            );
          },
        ));
  }
}
