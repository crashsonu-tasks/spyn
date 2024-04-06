// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

class AppText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color color;
  final double? textSize;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final bool selectable;

  const AppText({
    super.key,
    required this.text,
    this.bold = true,
    this.color = Colors.black,
    this.textSize,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
    this.selectable = true,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: textSize == null
            ? width > 600
                ? textSize ?? 14
                : 13
            : textSize!,
        overflow: overflow,
      ),
    );
  }
}
