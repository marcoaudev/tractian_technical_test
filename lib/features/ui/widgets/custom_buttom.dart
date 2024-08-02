import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String label;
  final Icon icon;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final void Function()? onPressed;

  const CustomButtom({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 35,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.grey, width: 0.5)),
            elevation: 0),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            Text(
              label,
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
