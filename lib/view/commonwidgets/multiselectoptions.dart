import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:multiselect/multiselect.dart';

class MultiselectDropdownSearch extends StatelessWidget {
  final List<String> items;
  final List<String> selected;

  final String? hintText;
  final Widget? prefixIcon;

  final void Function(List<String>?)? onChange;
  const MultiselectDropdownSearch({
    Key? key,
    required this.selected,
    this.hintText,
    required this.items,
    this.onChange,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DropDownMultiSelect(
        icon: prefixIcon,
        onChanged: (p0) => onChange!(p0),
        options: items,
        selectedValues: selected,
        whenEmpty: 'Nature de mission',
      ),
    );
  }
}
