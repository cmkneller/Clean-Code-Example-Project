/// [File] login_bloc.dart
///
/// This file holds a [LoginBloc] class used to
/// handle the presentation of the login screen and form
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///
library;

import 'package:bloc/bloc.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/entities/validators/email_validator.dart';
import '../../../../../core/utility/failure.dart';
import '../../../../../core/utility/submission_status.dart';
import '../../../domain/entities/validators/password_validator.dart';
import '../../../domain/usecases/login_user_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../config/locator.dart';

import '../../../../../core/utility/validator.dart';
import 'login_events.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LogInUserUsecase signInUsecase = getIt.get<LogInUserUsecase>();

  final EmailValidator emailValidator = EmailValidator();
  final PasswordValidator passwordValidator = PasswordValidator();

  /// Maps [LoginEvent]s to [LoginState]
  LoginBloc() : super(LoginState.initial()) {
    on<UpdateEmailLoginEvent>(updateEmail);
    on<UpdatePasswordLoginEvent>(updatePassword);
    on<SubmitLoginEvent>(submit);
    on<InitLoginBlocEvent>(initBloc);
  }

  void initBloc(InitLoginBlocEvent event, Emitter emit) {
    emit(LoginState.initial());
  }

  /// Updates and Validates email address
  ///
  /// Accepts [UpdateEmailLoginEvent] event and [Emitter] emit
  void updateEmail(UpdateEmailLoginEvent event, Emitter<LoginState> emit) {
    ValidationResult result = emailValidator.validate(event.email);
    emit(state.copyWith(email: event.email, emailValid: result.isValid));
  }

  /// Updates and Validates Password
  ///
  /// Accepts [UpdatePasswordLoginEvent] event and [Emitter] emit
  void updatePassword(
      UpdatePasswordLoginEvent event, Emitter<LoginState> emit) {
    ValidationResult result = passwordValidator.validate(event.password);
    emit(state.copyWith(
        password: event.password, passwordValid: result.isValid));
  }

  /// Submits the information
  ///
  /// Accepts a [SubmitLoginEvent] and [Emitter] emit
  void submit(SubmitLoginEvent event, Emitter<LoginState> emit) async {
    if (state.emailValid && state.passwordValid) {
      emit(state.copyWith(status: AsyncStatus.inProgress));

      LoginUsecaseParams params =
          LoginUsecaseParams(email: state.email, password: state.password);

      // Executes the signin usecase
      Either<Failure, User> execution = await signInUsecase.execute(params);

      // Folds the result
      execution.fold((l) {
        // Failure case:
        emit(state.copyWith(
          status: AsyncStatus.error,
        ));
      }, (r) {
        // Sucess case:
        emit(state.copyWith(status: AsyncStatus.succesful, appUser: r));

        add(InitLoginBlocEvent());
      });
    }
  }
}
