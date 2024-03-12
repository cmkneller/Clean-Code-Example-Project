/// [File] locator.dart
///
/// This file holds an [Locator] class,
/// used to register classes for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import 'package:clean_code_example_project/src/core/utility/module.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Locator {
  final List<Module> moduleList;

  Locator({required this.moduleList}) {
    initDependancies();
    getIt.allowReassignment = true;
  }

  /// Inits dependancies on all of the application layers
  void initDependancies() {
    initDataLayer();
    initDomainLayer();
    initPresentationLayer();
  }

  /// Loops through the [moduleList] and registers data layer classes
  void initDataLayer() {
    for (Module module in moduleList) {
      module.registerDataSources();
    }
  }

  /// Loops through the [moduleList] and registers domain layer classes

  void initDomainLayer() {
    for (Module module in moduleList) {
      module.registerRepositories();
      module.registerUsecases();
    }
  }

  /// Loops through the [moduleList] and registers presentation layer classes

  void initPresentationLayer() {
    for (Module module in moduleList) {
      module.registerBlocs();
    }
  }
}
