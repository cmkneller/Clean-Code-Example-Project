/// [File] auth_module.dart
///
/// This file holds an [AuthModule] extension on [GetIt],
/// used to register classes in the auth module for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:clean_code_example_project/src/core/utility/module.dart';
import 'package:get_it/get_it.dart';

import '../../config/locator.dart';
import '../../../mocked/fake_api.dart';
import 'data/data_sources/abstract/auth_data_source.dart';
import 'data/data_sources/implemented/impl_auth_data_source.dart';
import 'data/repositories/impl_auth_repository.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_user_usecase.dart';
import 'domain/usecases/logout_user_usecase.dart';
import 'presentation/bloc/login/login_bloc.dart';

class AuthModule implements Module {
  @override
  void registerDataSources() {
    getIt.registerLazySingleton<FakeAPI>(() => FakeAPI());
    getIt.registerLazySingleton<AuthDataSource>(() => ImplAuthDataSource());
  }

  @override
  void registerRepositories() {
    getIt.registerLazySingleton<AuthRepository>(() => ImplAuthRepository());
  }

  @override
  void registerUsecases() {
    getIt.registerLazySingleton<LogInUserUsecase>(() => LogInUserUsecase());
    getIt.registerLazySingleton<LogOutUserUsecase>(() => LogOutUserUsecase());
  }

  @override
  void registerBlocs() {
    getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());
  }
}
