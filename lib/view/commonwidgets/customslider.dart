import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:anomalyreport/core/constant/text_styles.dart';

class CustomSliderFiled extends StatelessWidget {
  final double value;
  final double? min;
  final double? max;
  final int? divisions;
  final void Function(double?) onChanged;
  const CustomSliderFiled({
    Key? key,
    this.min,
    this.max,
    this.divisions,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade500,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(1)),
        padding: const EdgeInsets.all(10),
        margin: EdgeInsetsDirectional.only(start: 5),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Slider(
                label: value.toString(),
                min: min ?? 0,
                max: max ?? 10,
                divisions: divisions,
                value: value,
                onChanged: onChanged,
              ),
            ),
            Expanded(
                flex: 1,
                child: Badge(
                  child: Text(
                    value.round().toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.amber,
                ))
          ],
        ));
  }
}
