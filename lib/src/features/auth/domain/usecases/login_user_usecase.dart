/// [File] login_user_usecase.dart
///
/// This file holds an implemented [LogInUserUsecase] class
/// used when the user signs in using an email and password
///
/// [Author] Chris Kneller
/// [support] chris@swiftpitch.app
/// [Date] March 5, 2024

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../config/locator.dart';
import '../../../../core/utility/exception_extension.dart';
import '../../../../core/utility/failure.dart';
import '../../../../core/utility/usecase.dart';
import '../../../error/domain/repositories/abstract/error_repository.dart';
import '../entities/email.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LogInUserUsecase extends Usecase<LoginUsecaseParams, User> {
  final AuthRepository authRepository = getIt.get<AuthRepository>();
  final ErrorRepository errorRepository = getIt.get<ErrorRepository>();

  /// Executes the signin operation, accepts [params]
  ///
  /// returns either an [User] or [Failure] based on the status of the
  /// operation
  ///
  @override
  Future<Either<Failure, User>> execute(LoginUsecaseParams params) async {
    try {
      Email email = Email(emailString: params.email);

      User authUser = await authRepository.loginUser(
          email: email, password: params.password);

      return Right(authUser);
    } on Exception catch (e) {
      Failure failure = Failure(severity: Severity.low, message: e.message);
      errorRepository.pushError(failure);
      return Left(failure);
    }
  }
}

/// Parameters for the [LoginUsecase]
class LoginUsecaseParams extends Equatable {
  final String email;
  final String password;
  const LoginUsecaseParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
