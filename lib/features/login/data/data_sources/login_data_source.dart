import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:keep_code/features/login/domain/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> login(String? email, String? passWord);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<UserModel> login(String? email, String? passWord) async {
    try {
      final url =
          'https://sms-activate.org/stubs/handler_auth.php?email=$email&code=$passWord&action=confirmEmailByCode';
      final response = await http.get(Uri.parse(url));
      final parced = jsonDecode(response.body);

      return UserModel.fromJson(parced);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
