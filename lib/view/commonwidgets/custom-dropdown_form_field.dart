import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustumDropdownSearch extends StatelessWidget {
  final List<String> items;
  final String? hintText;
  final String? selectedItem;
  final Widget? prefixIcon;

  final String? Function(String?) valid;
  final void Function(String?)? onChange;
  const CustumDropdownSearch({
    Key? key,
    this.selectedItem,
    this.hintText,
    required this.items,
    this.onChange,
    this.prefixIcon,
    required this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('x'),
          ),
          items: items,
          validator: valid,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: hintText,
              hintText: hintText,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.green),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey),
              ),
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
          onChanged: onChange,
          selectedItem: selectedItem ?? '',
        ));
  }
}
