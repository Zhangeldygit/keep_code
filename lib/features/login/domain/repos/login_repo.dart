import 'package:keep_code/features/login/domain/models/user_model.dart';

abstract class LoginRepo {
  Future<UserModel> login(String? email, String? passWord);
}
