/// [File] login_state.dart
///
/// This file holds a [LoginState] class used in
/// the login bloc
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///
library;

import 'package:equatable/equatable.dart';

import '../../../../../core/utility/submission_status.dart';
import '../../../domain/entities/user.dart';

class LoginState extends Equatable {
  final AsyncStatus status;
  final String email;
  final String password;

  final bool emailValid;
  final bool passwordValid;
  final User appUser;

  const LoginState(
      {required this.status,
      required this.email,
      required this.appUser,
      required this.password,
      required this.emailValid,
      required this.passwordValid});

  /// Creates an initial state
  ///
  /// Returns a [LoginState]
  factory LoginState.initial() => const LoginState(
      status: AsyncStatus.initial,
      appUser: NullUser(),
      email: "",
      password: "",
      emailValid: false,
      passwordValid: false);

  @override
  List<Object> get props {
    return [
      status,
      email,
      password,
      emailValid,
      passwordValid,
    ];
  }

  /// Creates a copy of the login state
  ///
  /// Accepts any field and
  /// returns a copied version of [LoginState] with the fields changed
  LoginState copyWith(
      {AsyncStatus? status,
      String? email,
      String? password,
      bool? emailValid,
      bool? passwordValid,
      User? appUser}) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      appUser: appUser ?? this.appUser,
      password: password ?? this.password,
      emailValid: emailValid ?? this.emailValid,
      passwordValid: passwordValid ?? this.passwordValid,
    );
  }
}
