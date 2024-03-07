/// [File] ErrorRepository.dart
///
/// This file holds an abstract ErrorRepository class
/// to hold an error stream, allowing bloc-to-bloc communication.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2023
library;

import '../../../../../core/utility/failure.dart';

/// Class to allow blocs to push errors to the error bloc
abstract class ErrorRepository {
  Stream<Failure> get errorStream;

  /// Accepts [Failure] to be pushed to the error queue.
  void pushError(Failure error);

  /// Disimisses current error
  void dismissError();

  /// Disposes of stream
  void dispose();
}
