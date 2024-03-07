/// [File] error_state.dart
///
/// This file holds an [ErrorState] used in the error bloc
///
/// [Author] Chris Kneller
/// [support] chris@swiftpitch.app
/// [Date] November 19, 2023
library;

import 'package:equatable/equatable.dart';

import '../../../../core/utility/failure.dart';

/// Used to track the status of the error
enum ErrorStatus { none, error }

class ErrorState extends Equatable {
  final ErrorStatus errorStatus;
  final Failure error;

  const ErrorState({
    required this.errorStatus,
    required this.error,
  });

  factory ErrorState.initial() =>
      const ErrorState(errorStatus: ErrorStatus.none, error: NullFailure());

  @override
  List<Object?> get props => [errorStatus, error];

  ErrorState copyWith({
    ErrorStatus? errorStatus,
    Failure? error,
  }) {
    return ErrorState(
      errorStatus: errorStatus ?? this.errorStatus,
      error: error ?? this.error,
    );
  }
}
