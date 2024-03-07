/// [File] error_event.dart
///
/// This file holds a number of [ErrorEvent] classes used in the error bloc
///
/// [Author] Chris Kneller
/// [Date] November 19, 2023
library;

import '../../../../core/utility/failure.dart';
import 'package:equatable/equatable.dart';

class ErrorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// For when an error should be pushed to the repository
///
/// Accepts a [Failure] error
class RegisterErrorEvent extends ErrorEvent {
  final Failure error;
  RegisterErrorEvent({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

/// For when the error stream in the repository has been updated
///
/// Accepts a [Failure] error
class ErrorStreanUpdatedEvent extends ErrorEvent {
  final List<Failure> errors;
  ErrorStreanUpdatedEvent({
    required this.errors,
  });

  @override
  List<Object> get props => [];
}

/// For when an error should be dismissed
class DismissErrorEvent extends ErrorEvent {
  DismissErrorEvent();

  @override
  List<Object?> get props => [];
}
