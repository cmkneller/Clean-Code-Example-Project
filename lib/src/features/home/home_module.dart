/// [File] home_module.dart
///
/// This file holds an [HomeModule] extension on [GetIt],
/// used to register classes in the auth module for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import '../../config/locator.dart';
import 'domain/usecases/load_user_usecase.dart';
import 'presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

extension HomeModule on GetIt {
  /// Inits API
  void initHomeApis() {}

  /// Inits Data source
  void initHomeDataSources() {}

  /// Inits Repos
  void initHomeRepos() {}

  /// Inits Usecases
  void initHomeUsecases() {
    getIt.registerLazySingleton(() => LoadUserUsecase());
  }

  /// Inits Blocs
  void initHomeBlocs() {
    getIt.registerLazySingleton(() => HomeBloc());
  }
}
