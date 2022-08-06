import 'package:flutter/material.dart';
import 'package:alltests/core/constants/strings.dart';
import 'package:alltests/widgets/texts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SmallText(text: Strings.enterButton),
        ),
      ),
    );
  }
}
