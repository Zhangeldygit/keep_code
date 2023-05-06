import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/login/domain/use_cases/login_use_cases.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(LoginInitial()) {
    on<OnLogin>(_onLogin);
    on<OnCheckLogin>(_onCheckAuth);
  }

  Future<void> _onLogin(
    OnLogin event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final user = await _loginUseCase.call(event.email, event.passWord);

    if (user.sessionId != null) {
      emit(LoginSuccess());
    } else {
      emit(const LoginFailure(error: 'Something went wrong'));
    }
  }

  Future<void> _onCheckAuth(
    OnCheckLogin event,
    Emitter<LoginState> emit,
  ) async {
    final box = Hive.box("tokens");
    final token = box.get('sessionId');
    log("token $token");
    if (token != null) {
      emit(LoginSuccess());
    } else {
      emit(UnAuthState());
    }
  }
}
