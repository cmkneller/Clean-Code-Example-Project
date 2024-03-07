/// [File] logout_user_usecase.dart
///
/// This file holds an implemented [LogOutUserUsecase] class
/// used when the user signs in using an email and password
///
/// [Author] Chris Kneller
/// [support] chris@swiftpitch.app
/// [Date] March 5, 2024

import 'package:dartz/dartz.dart';

import '../../../../config/locator.dart';
import '../../../../core/utility/empty_params.dart';
import '../../../../core/utility/exception_extension.dart';
import '../../../../core/utility/failure.dart';
import '../../../../core/utility/usecase.dart';
import '../../../error/domain/repositories/abstract/error_repository.dart';
import '../repositories/auth_repository.dart';

class LogOutUserUsecase extends Usecase<EmptyParams, void> {
  final AuthRepository authRepository = getIt.get<AuthRepository>();
  final ErrorRepository errorRepository = getIt.get<ErrorRepository>();

  /// Executes the logout operation
  @override
  Future<Either<Failure, void>> execute(params) async {
    try {
      return const Right(null);
    } on Exception catch (e) {
      Failure failure = Failure(severity: Severity.low, message: e.message);
      errorRepository.pushError(failure);
      return Left(failure);
    }
  }
}
