/// [File] locator.dart
///
/// This file holds an [Locator] class,
/// used to register classes for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import 'package:clean_code_example_project/src/features/auth/auth_module.dart';
import 'package:clean_code_example_project/src/features/error/error_module.dart';
import 'package:clean_code_example_project/src/features/home/home_module.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Locator {
  void initDependancies() {
    initApis();
    initDataSources();
    initRepositories();
    initUsecases();
    initBlocs();
    getIt.allowReassignment = true;
  }

  /// Inits all api classes
  void initApis() {
    getIt.initAuthApis();
  }

  /// Inits all data source classes
  void initDataSources() {
    getIt.initAuthDataSources();
  }

  /// Inits all repos
  void initRepositories() {
    getIt.initErrorRepos();
    getIt.initAuthRepos();
  }

  /// Inits usescases
  void initUsecases() {
    getIt.initAuthUsecases();
    getIt.initHomeUsecases();
  }

  /// Inits blocs
  void initBlocs() {
    getIt.initAuthBlocs();
    getIt.initHomeBlocs();
    getIt.initErrorBlocs();
  }
}
