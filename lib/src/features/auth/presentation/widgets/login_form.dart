/// [File] login_form.dart
///
/// This file holds a [LoginForm] widget, to be
/// used in the login screen
///
/// [Author] Chris Kneller
/// [Date] March 5, 2023

library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/locator.dart';
import '../../../../core/shared/widgets/custom_button.dart';
import '../../../../core/utility/submission_status.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_events.dart';
import '../bloc/login/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginBloc bloc = getIt.get<LoginBloc>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // Add aditional listening logic if needed
      },
      bloc: bloc,
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Email Field
                  TextField(
                    onChanged: (value) =>
                        bloc.add(UpdateEmailLoginEvent(email: value)),
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.white,
                        filled: true),
                  ),

                  // Margin
                  const SizedBox(
                    height: 50,
                  ),

                  // Password Field
                  TextField(
                    onChanged: (value) =>
                        bloc.add(UpdatePasswordLoginEvent(password: value)),
                    obscureText: hidePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  CustomButton(
                    isGradient: true,
                    function: () {
                      bloc.add(SubmitLoginEvent());
                    },
                    isDark: false,
                    activated: state.emailValid && state.passwordValid,
                    child: state.status == AsyncStatus.inProgress
                        ? const CircularProgressIndicator()
                        : const Text("Sign In!",
                            style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
