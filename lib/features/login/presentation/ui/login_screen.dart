import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/constants/app_button_styles.dart';
import 'package:keep_code/constants/app_styles.dart';
import 'package:keep_code/features/login/presentation/bloc/login_bloc.dart';
import 'package:keep_code/features/services_and_countries/presentation/blocs/countries_and_services/countries_and_services_bloc.dart';
import 'package:keep_code/widgets/alert_dialog.dart';
import 'package:keep_code/widgets/login_text_field.dart';
import 'package:keep_code/widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountriesAndServicesBloc, CountriesAndServicesState>(
        builder: (context, state) {
          if (state is CountriesAndServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountriesAndServicesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    const Center(child: CircularProgressIndicator());
                  }
                  if (state is LoginFailure) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AppAlertDialog(
                          title: const Text("Error"),
                          content: Text(
                            state.error,
                          ),
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UnAuthState || state is LoginFailure) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LoginTextField(
                          controller: emailController,
                        ),
                        const SizedBox(height: 10.0),
                        PasswordTextField(
                          controller: passwordController,
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: AppButtonStyles.elevated1,
                                child: Text(
                                  "Войти",
                                  style: AppStyles.s16w600,
                                ),
                                onPressed: () {
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    FocusScope.of(context).unfocus();

                                    context.read<LoginBloc>().add(OnLogin(
                                        email: emailController.text,
                                        passWord: passwordController.text));
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
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
