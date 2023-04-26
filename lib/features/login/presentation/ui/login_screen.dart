import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/constants/app_button_styles.dart';
import 'package:keep_code/constants/app_styles.dart';
import 'package:keep_code/features/login/presentation/bloc/login_bloc.dart';
import 'package:keep_code/widgets/alert_dialog.dart';
import 'package:keep_code/widgets/login_text_field.dart';
import 'package:keep_code/widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LoginTextField(
                onSaved: (login) {
                  email = login!;
                },
              ),
              const SizedBox(height: 10.0),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: AppButtonStyles.elevated1,
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return Text(
                              "Войти",
                              style: AppStyles.s16w600,
                            );
                          }
                        },
                      ),
                      onPressed: () {
                        if (email.isNotEmpty && password.isNotEmpty) {
                          context
                              .read<LoginBloc>()
                              .add(OnLogin(email: email, passWord: password));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AppAlertDialog(
                                title: Text("Error"),
                                content: Text(
                                  "Заполните логин и пароль",
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
