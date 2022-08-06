import 'package:alltests/core/utils/validators/validators.dart';
import 'package:alltests/widgets/outline_input_text.dart';
import 'package:alltests/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:alltests/core/constants/assets_name.dart';
import 'package:alltests/core/constants/strings.dart';
import 'package:alltests/widgets/texts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Image.asset(AssetsName.logo),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Center(
            child: BigText(
              text: Strings.appTitle,
            ),
          ),
        )
      ],
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, this.onChanged}) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return OutlinedInputText(
      keyboardType: TextInputType.emailAddress,
      labelText: Strings.emailTextInputField,
      validator: Validators.validateEmail,
      onChanged: onChanged,
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    this.changePasswordVisible,
    this.showPassword = false,
    this.onChanged,
  }) : super(key: key);

  final Function()? changePasswordVisible;
  final Function(String)? onChanged;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return OutlinedInputText(
      changePasswordVisible: changePasswordVisible,
      labelText: Strings.senhaTextInputField,
      validator: Validators.validateEmpty,
      passwordIsVisble: showPassword,
      onChanged: onChanged,
      isPassword: true,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onPressed: onPressed,
    );
  }
}
