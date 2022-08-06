import 'package:alltests/features/auth/controller/auth_controller.dart';
import 'package:alltests/core/utils/routes/routes_name.dart';
import 'package:alltests/widgets/auth_screen_widgets.dart';
import 'package:alltests/core/constants/text_styles.dart';
import 'package:alltests/core/constants/strings.dart';
import 'package:alltests/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  AuthView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: materialColor),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Logo(key: Key('logo')),
                EmailInput(onChanged: _authController.updateEmail),
                Obx(
                  () {
                    return PasswordInput(
                      showPassword: _authController.passwordIsVisible,
                      changePasswordVisible: () {
                        _authController.changePasswordVisible();
                      },
                      onChanged: _authController.updatePassword,
                    );
                  },
                ),
                LoginButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_authController.auth()) {
                        _authController.navigateTo(Routes.home);
                      } else {
                        _showDialog(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            Strings.loginFailedTitle,
            style: TextStyles.fontSize18(
              color: Colors.white,
            ),
          ),
          content: Text(
            Strings.loginFailedContent,
            style: TextStyles.fontSize14(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
