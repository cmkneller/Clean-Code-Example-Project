/// [File] usecase.dart
///
/// This file holds an abstract [Usecase] class
/// used in blocs to communicate with the domain layer
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:dartz/dartz.dart';

import 'failure.dart';

abstract class Usecase<Params, Result> {
  Future<Either<Failure, Result>> execute(Params params);
}
