import 'package:alltests/core/models/auth.dart';
import 'package:alltests/features/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/main.dart' as app;

void main() {
  late AuthRepository repository;
  late String password = '';
  late String email = '';

  setUp(() {
    repository = AuthRepository.instance;
  });

  test('should perform login sucessfully', () async {
    email = 'liukang@wins.com';
    password = 'KitanaKahn';

    final authData = Auth(
      email: email,
      password: password,
    );

    expect(repository.auth(authData), true);
  });
  test('shouldn\'t perform login: wrong password', () async {
    email = 'liukang@wins.com';
    password = 'wrongpassword';

    final authData = Auth(
      email: email,
      password: password,
    );

    expect(repository.auth(authData), false);
  });
  test('shouldn\'t perform login: wrong email', () async {
    email = 'wrong@email.com';
    password = 'KitanaKahn';

    final authData = Auth(
      email: email,
      password: password,
    );

    expect(repository.auth(authData), false);
  });
  test('shouldn\'t perform login: empty data', () async {
    app.main();
    email = '';
    password = '';

    final authData = Auth(
      email: email,
      password: password,
    );

    expect(repository.auth(authData), false);
  });
}
