/// [File] load_user_usecase.dart
///
/// This file holds an implemented [LoadUserUsecase] class
/// used to fetch the current user
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import 'package:dartz/dartz.dart';

import '../../../../config/locator.dart';
import '../../../../core/utility/empty_params.dart';
import '../../../../core/utility/exception_extension.dart';
import '../../../../core/utility/failure.dart';
import '../../../../core/utility/usecase.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../error/domain/repositories/abstract/error_repository.dart';

class LoadUserUsecase extends Usecase<EmptyParams, User> {
  final AuthRepository authRepository = getIt.get<AuthRepository>();
  final ErrorRepository errorRepository = getIt.get<ErrorRepository>();

  /// Executes the signin operation, accepts [params]
  ///
  /// returns either an [User] or [Failure] based on the status of the
  /// operation

  @override
  Future<Either<Failure, User>> execute(params) async {
    try {
      User authUser = authRepository.currUser;

      return Right(authUser);
    } on Exception catch (e) {
      Failure failure = Failure(severity: Severity.low, message: e.message);
      errorRepository.pushError(failure);
      return Left(failure);
    }
  }
}
