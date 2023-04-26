part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnLogin extends LoginEvent {
  final String? email;
  final String? passWord;

  const OnLogin({this.email, this.passWord});

  @override
  List<Object> get props => [];
}

class OnCheckLogin extends LoginEvent {}
