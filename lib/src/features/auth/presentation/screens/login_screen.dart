/// [File] login_screen.dart
///
/// This file holds the app's [LoginScreen]
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/locator.dart';
import '../../../../core/utility/submission_status.dart';
import '../../../error/presentation/widgets/error_wrapper.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_events.dart';
import '../bloc/login/login_state.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = getIt.get<LoginBloc>();

  @override
  void initState() {
    bloc.add(InitLoginBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ErrorWrapper(
      widget: Scaffold(
          appBar: AppBar(title: const Text("Login")),
          body: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.status == AsyncStatus.succesful) {
                  // If the login operation was successfull, we push to the home page
                  context.pushReplacementNamed(HomeScreen.routeName);
                }
              },
              bloc: bloc,
              builder: (context, state) {
                return const Column(
                  children: [
                    LoginForm(),
                  ],
                );
              })),
    );
  }
}
