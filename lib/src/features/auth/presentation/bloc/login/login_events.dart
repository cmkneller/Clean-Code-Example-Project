/// [File] login_events.dart
///
/// This file holds a number of [LoginEvent] classes used in
/// the login bloc
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///
library;

import 'package:equatable/equatable.dart';

/// Parent [LoginEvent] class
class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

/// Event to initialise the login process
class InitLoginBlocEvent extends LoginEvent {}

/// Called whenever the email field is updated
class UpdateEmailLoginEvent extends LoginEvent {
  final String email;
  const UpdateEmailLoginEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

/// Called whenever the password field is updated
class UpdatePasswordLoginEvent extends LoginEvent {
  final String password;
  const UpdatePasswordLoginEvent({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}

/// Called when login form is submitted
class SubmitLoginEvent extends LoginEvent {}
