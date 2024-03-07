/// [File] empty_params.dart
///
/// Holds a dummy params class used in usecases that
/// don't require any paramenters
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:equatable/equatable.dart';

class EmptyParams extends Equatable {
  @override
  List<Object?> get props => [];
}
