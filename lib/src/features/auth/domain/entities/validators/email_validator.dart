/// [File] email_validator.dart
///
/// Holds an email validator class
///
/// [Author] Chris Kneller
/// [Date] August 24, 2023
library;

import '../../../../../core/utility/validator.dart';

/// Email validator class, implements [Validator]
/// overrides the [validate] method to ensure the [String] value
/// provided is a valid email address or not
class EmailValidator implements Validator<String> {
  static const String emailRegEx = r"[\w-\.]+@([\w-]+\.)+[\w-]{2,4}";
  static const String invalidEmailMessage = "Invalid email provided";

  /// Validates [String] email [value] passed to it
  ///
  /// Returns a [ValidationResult]
  @override
  ValidationResult validate(value) {
    if (RegExp(emailRegEx).hasMatch(value)) {
      return ValidationResult(isValid: true, message: "");
    }

    return ValidationResult(isValid: false, message: invalidEmailMessage);
  }
}
