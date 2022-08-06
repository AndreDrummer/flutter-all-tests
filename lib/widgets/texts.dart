import 'package:flutter/material.dart';
import 'package:alltests/core/constants/theme.dart';

class BigText extends StatelessWidget {
  const BigText({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 36,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  const SmallText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: materialColor,
        fontSize: 18,
      ),
    );
  }
}
