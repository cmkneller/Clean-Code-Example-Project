/// [File] exception_extension.dart
///
/// This file holds an [FormatMessage] extension on [Exception],
/// used to register classes in the error module for dependancy injection.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
extension FormatMessage on Exception {
  String get message {
    if (toString().startsWith("Exception: ")) {
      return toString().substring(11);
    } else {
      return toString();
    }
  }
}
