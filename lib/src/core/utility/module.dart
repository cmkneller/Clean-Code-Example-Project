/// [File] module.dart
///
/// This file holds an abstract [Module] class to register classes for
/// dependancy injection
///
/// [Author] Chris Kneller
/// [Date] March 10, 2024
library;

abstract class Module {
  // Registers data source classes for DI
  void registerDataSources();
  // Registers repository classes for DI
  void registerRepositories();
  // Registers usecase classes for DI
  void registerUsecases();
  // Registers bloc classes for DI
  void registerBlocs();
}
