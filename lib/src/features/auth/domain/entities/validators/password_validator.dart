/// [File] password_validator.dart
///
/// This file holds the [PasswordValidator] class, which validates password strings
/// and returns a [ValidationResult].
///
/// [Author] Chris Kneller
/// [Date] March 5, 2023
library;

import '../../../../../core/utility/validator.dart';

class PasswordValidator extends Validator {
  static const String passwordRegEx =
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).+$";

  static const String passwordInvalidMessage =
      "Password is invalid, requires a mix of numbers, uppercase, lowercase and special characters";

  /// Checks an password string [value] for validity against a criteria
  /// and returns a [ValidationResult] with a boolean flag determining
  /// if the value is valid alongside a user friendly message.
  @override
  ValidationResult validate(value) {
    if (value.length < 6) {
      return ValidationResult(isValid: false, message: passwordInvalidMessage);
    }

    if (RegExp(passwordRegEx).hasMatch(value)) {
      return ValidationResult(isValid: true, message: "");
    }

    return ValidationResult(isValid: false, message: passwordInvalidMessage);
  }
}
