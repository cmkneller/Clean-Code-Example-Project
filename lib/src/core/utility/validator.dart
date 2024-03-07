/// [File] validator.dart
///
/// This file contains an abstract validator class alongside
/// a validation result class.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

/// Abstract class used during the parsing application layer
/// to determine if user-entered strings are valid values
///
/// returns a [ValidationResult] instance detailing if data is valid
/// and holding an optional message.
abstract class Validator<String> {
  ValidationResult validate(String value);
}

class ValidationResult {
  bool isValid;
  String message;
  ValidationResult({
    required this.isValid,
    required this.message,
  });
}
