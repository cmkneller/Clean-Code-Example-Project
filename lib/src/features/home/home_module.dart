/// [File] home_module.dart
///
/// This file holds an [HomeModule] class,
/// used to register classes in the auth module for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import 'package:clean_code_example_project/src/core/utility/module.dart';

import '../../config/locator.dart';
import 'domain/usecases/load_user_usecase.dart';
import 'presentation/bloc/home_bloc.dart';

class HomeModule implements Module {
  @override
  void registerBlocs() {
    getIt.registerLazySingleton(() => HomeBloc());
  }

  @override
  void registerDataSources() {}

  @override
  void registerRepositories() {
    getIt.registerLazySingleton(() => LoadUserUsecase());
  }

  @override
  void registerUsecases() {}
}
