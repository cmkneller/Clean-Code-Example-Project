/// [File] failure.dart
///
/// This file holds an [Failure] class to be used as a return type in a
/// [Usecase] if an operation failed.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:equatable/equatable.dart';

enum Severity { low, medium, high }

class Failure extends Equatable {
  final Severity severity;
  final String message;

  const Failure({
    required this.severity,
    required this.message,
  });

  @override
  List<Object> get props => [severity, message];
}

/// Used to represent an empty error
class NullFailure extends Failure {
  const NullFailure() : super(message: "_", severity: Severity.low);
}
