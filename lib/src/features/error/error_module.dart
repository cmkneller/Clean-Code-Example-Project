/// [File] auth_module.dart
///
/// This file holds an [ErrorModule] extension on [GetIt],
/// used to register classes in the error module for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:get_it/get_it.dart';

import '../../config/locator.dart';
import 'domain/repositories/abstract/error_repository.dart';
import 'domain/repositories/implemented/impl_error_repository.dart';
import 'presentation/bloc/error_bloc.dart';

extension ErrorModule on GetIt {
  /// Inits API
  void initErrorApis() {}

  /// Inits Data source
  void initErrorDataSources() {}

  /// Inits Repos
  void initErrorRepos() {
    getIt.registerLazySingleton<ErrorRepository>(() => ImplErrorRepository());
  }

  /// Inits Usecases
  void initErrorUsecases() {}

  /// Inits Blocs
  void initErrorBlocs() {
    getIt.registerLazySingleton<ErrorBloc>(() => ErrorBloc());
  }
}
