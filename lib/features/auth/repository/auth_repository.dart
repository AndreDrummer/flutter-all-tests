import 'package:alltests/core/database/db.dart';
import 'package:alltests/core/models/auth.dart';

class AuthRepository {
  AuthRepository._();

  static final AuthRepository instance = AuthRepository._();
  Auth _authData = Auth(password: '', email: '');
  final Database _db = Database.instance;

  Auth get authData => _authData;

  bool auth(Auth authData) {
    _authData = authData;
    return _successfullLogin();
  }

  bool _successfullLogin() {
    return _authData.email == _db.email && _authData.password == _db.password;
  }
}
