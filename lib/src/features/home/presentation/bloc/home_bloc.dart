/// [File] home_bloc.dart
///
/// This file holds a [HomeBloc] class used to
/// handle the presentation of the home screen
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/locator.dart';
import '../../../../core/utility/empty_params.dart';
import '../../../../core/utility/failure.dart';
import '../../../../core/utility/submission_status.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/domain/usecases/logout_user_usecase.dart';
import '../../domain/usecases/load_user_usecase.dart';
import 'home_events.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadUserUsecase loadUserUsecase = getIt.get<LoadUserUsecase>();
  final LogOutUserUsecase logOutUserUsecase = getIt.get<LogOutUserUsecase>();

  HomeBloc() : super(HomeState.initial()) {
    on<InitHomeEvent>(loadUser);
    on<LogoutHomeEvent>(logoutUser);
  }

  /// Loads user into the home screen
  Future<void> loadUser(InitHomeEvent event, Emitter<HomeState> emit) async {
    Either<Failure, User> execution =
        await loadUserUsecase.execute(EmptyParams());

    execution.fold((l) {
      emit(state.copyWith(
        status: AsyncStatus.error,
      ));
    }, (r) {
      emit(state.copyWith(status: AsyncStatus.succesful, user: r));
    });
  }

  /// Logs the user out
  Future<void> logoutUser(
      LogoutHomeEvent event, Emitter<HomeState> emit) async {
        Either<Failure, void> execution =
          await logOutUserUsecase.execute(EmptyParams());
        execution.fold((l) {
          emit(state.copyWith(status: AsyncStatus.error));
        }, (r) {
          // Do Nothing
        });
      }
}
