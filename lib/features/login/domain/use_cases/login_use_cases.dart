import 'package:keep_code/features/login/domain/models/user_model.dart';
import 'package:keep_code/features/login/domain/repos/login_repo.dart';

abstract class LoginUseCase<T> {
  Future<UserModel> call(String? email, String? passWord);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepo repo;

  LoginUseCaseImpl(this.repo);

  @override
  Future<UserModel> call(String? email, String? passWord) {
    final data = repo.login(email, passWord);
    return data;
  }
}
