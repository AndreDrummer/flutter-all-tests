import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OutlinedInputText extends StatelessWidget {
  const OutlinedInputText({
    this.textCapitalization = TextCapitalization.none,
    this.passwordIsVisble = false,
    this.changePasswordVisible,
    this.labelText = 'E-mail',
    this.isPassword = false,
    this.inputFormatters,
    this.keyboardType,
    this.initialValue,
    this.textColor,
    this.onChanged,
    this.hintText,
    this.validator,
    this.maxLength,
    Key? key,
  }) : super(key: key);

  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final void Function()? changePasswordVisible;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool passwordIsVisble;
  final String? initialValue;
  final Color? textColor;
  final String? hintText;
  final String labelText;
  final bool isPassword;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withAlpha(50),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: isPassword && !passwordIsVisble,
              textCapitalization: textCapitalization,
              maxLength: isPassword ? 255 : maxLength,
              inputFormatters: inputFormatters,
              initialValue: initialValue,
              keyboardType: keyboardType,
              onChanged: onChanged,
              validator: validator,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
              cursorColor: textColor ?? Colors.white,
              decoration: InputDecoration(
                hintText: hintText,
                counterText: '',
                labelText: labelText,
                hintStyle: TextStyle(
                  color: textColor != null
                      ? textColor!.withOpacity(.7)
                      : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                errorStyle: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.0,
                ),
                labelStyle: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 21.0,
                ),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          Visibility(
            visible: isPassword,
            child: IconButton(
              onPressed: changePasswordVisible,
              icon: Icon(
                passwordIsVisble
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
