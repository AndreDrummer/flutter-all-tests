import 'package:alltests/core/models/auth.dart';
import 'package:alltests/features/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static final _authInstance = AuthRepository.instance;

  final Rx<Auth> _authData = _authInstance.authData.obs;
  final RxBool _passwordIsVisible = false.obs;

  bool get passwordIsVisible => _passwordIsVisible.value;

  bool auth() => _authInstance.auth(_authData.value);

  void changePasswordVisible() {
    _passwordIsVisible(!passwordIsVisible);
  }

  void updateEmail(String email) {
    _authData(
      Auth(password: _authData.value.password, email: email),
    );
  }

  void updatePassword(String password) {
    _authData(
      Auth(password: password, email: _authData.value.email),
    );
  }

  void navigateTo(String routeName) => Get.toNamed(routeName);
}
