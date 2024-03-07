/// [File] impl_error_repository.dart
///
/// This file holds an implementation of the ErrorRepository class
/// allowing the error bloc to listen to errors being pushed in realtime
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'dart:async';

import '../../../../../core/utility/failure.dart';
import '../abstract/error_repository.dart';

class ImplErrorRepository implements ErrorRepository {
  final _errorController = StreamController<Failure>.broadcast();
  final List<Failure> _errorQueue = [];

  /// Exposes the error stream
  @override
  Stream<Failure> get errorStream => _errorController.stream;

  /// Dismisses error from stream, adds the next one along if it exists
  @override
  void dismissError() {
    if (_errorQueue.isNotEmpty) {
      _errorQueue.removeAt(0);
      _errorController.sink.add(_errorQueue[0]);
    }
  }

  /// Adds [Failure] to the queue, and if it is the only error present,
  /// add it to the stream sink
  @override
  void pushError(Failure error) {
    _errorQueue.add(error);

    _errorController.sink.add(error);
  }

  /// Closes the stream controller when class is disposed
  @override
  void dispose() {
    _errorController.close();
  }
}
