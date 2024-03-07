/// [File] error_bloc.dart
///
/// This file holds a bloc used to handle the showing and dismissing
/// of user errors
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../config/locator.dart';
import '../../../../core/utility/failure.dart';
import '../../domain/repositories/abstract/error_repository.dart';
import 'error_event.dart';
import 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  final ErrorRepository errorRepository = getIt.get<ErrorRepository>();
  late StreamSubscription subscription;

  final ErrorSubscriptionManager subscriptionManager =
      ErrorSubscriptionManager();

  ErrorBloc() : super(ErrorState.initial()) {
    on<RegisterErrorEvent>(_onRegisterErrorEvent);
    on<DismissErrorEvent>(_onDismissErrorEvent);

    registerSubscription();
  }

  /// Registers a subscription to an error stream
  void registerSubscription() {
    subscriptionManager.subscribe(errorRepository.errorStream,
        (Failure failure) {
      add(RegisterErrorEvent(error: failure));
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();

    return super.close();
  }

  /// Pushes an error to the stream in the repository
  ///
  /// Accepts [RegisterErrorEvent] and an [Emitter].
  void _onRegisterErrorEvent(
      RegisterErrorEvent event, Emitter<ErrorState> emit) {
    emit(state.copyWith(errorStatus: ErrorStatus.error, error: event.error));
  }

  /// Dismisses an Error from the repositories error stream
  ///
  /// Accepts [DismissErrorEvent] event and [Emitter] emit
  void _onDismissErrorEvent(DismissErrorEvent event, Emitter<ErrorState> emit) {
    emit(state.copyWith(
        errorStatus: ErrorStatus.none, error: const NullFailure()));
  }
}

/// A subscription manager to subscribe to the error stream in the
/// error repository
class ErrorSubscriptionManager {
  StreamSubscription<Failure>? _subscription;

  /// Subscribes to the stream
  ///
  /// Accepts a [Stream] of [Failure]s and an on change [Function]
  void subscribe(Stream<Failure> failureStream, Function(Failure) onChanged) {
    _subscription = failureStream.listen(onChanged);
  }

  void unsubscribe() {
    _subscription?.cancel();
  }
}
