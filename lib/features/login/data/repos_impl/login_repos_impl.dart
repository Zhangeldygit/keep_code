import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/login/data/data_sources/login_data_source.dart';
import 'package:keep_code/features/login/domain/models/user_model.dart';
import 'package:keep_code/features/login/domain/repos/login_repo.dart';

class LoginReposImpl implements LoginRepo {
  final LoginDataSource loginDataSource;

  LoginReposImpl(this.loginDataSource);
  @override
  Future<UserModel> login(String? email, String? passWord) async {
    final box = Hive.box('tokens');
    try {
      final user = await loginDataSource.login(email, passWord);
      box.put('sessionId', user.sessionId);
      return user;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
