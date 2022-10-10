import 'login_data.dart';

class Login {
  final int? code;
  final LoginData? data;

  Login({this.code, this.data});

  factory Login.fromJSON(Map<String, dynamic> json) {
    final int? code = json['code'];
    var data;
    if (code == 200) {
      data = LoginData.fromJSON(json['data']);
    }
    return Login(code: code, data: data);
  }
}
