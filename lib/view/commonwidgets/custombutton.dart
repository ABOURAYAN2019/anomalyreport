import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? captiontext;
  final Color backgroundColor;
  final Icon icon;
  final Color txtcolor;
  final void Function()? onpressed;
  const CustomButton({
    Key? key,
    required this.txtcolor,
    this.captiontext,
    required this.icon,
    required this.backgroundColor,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton.icon(
         
          onPressed:  onpressed,
          icon: icon,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 50),
            backgroundColor: backgroundColor,
          ),
          label: Text(
            captiontext!,
            style: TextStyle(fontSize: 14, color: txtcolor),
          )),
    );
  }
}
