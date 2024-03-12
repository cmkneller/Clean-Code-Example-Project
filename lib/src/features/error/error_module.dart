/// [File] auth_module.dart
///
/// This file holds an [ErrorModule] class,
/// used to register classes in the error module for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:clean_code_example_project/src/core/utility/module.dart';

import '../../config/locator.dart';
import 'domain/repositories/abstract/error_repository.dart';
import 'domain/repositories/implemented/impl_error_repository.dart';
import 'presentation/bloc/error_bloc.dart';

class ErrorModule implements Module {
  @override
  void registerDataSources() {}

  @override
  void registerRepositories() {
    getIt.registerLazySingleton<ErrorRepository>(() => ImplErrorRepository());
  }

  @override
  void registerUsecases() {}
  @override
  void registerBlocs() {
    getIt.registerLazySingleton<ErrorBloc>(() => ErrorBloc());
  }
}
