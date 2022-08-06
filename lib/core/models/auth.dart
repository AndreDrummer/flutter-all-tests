import 'dart:convert';

class Auth {
  String password;
  String email;
  Auth({
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'email': email,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Auth(password: $password, email: $email)';
}
