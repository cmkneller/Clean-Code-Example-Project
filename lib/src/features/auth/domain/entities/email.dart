/// [File] email.dart
///
/// This file holds a [Email] class.
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///

import 'package:equatable/equatable.dart';

class Email extends Equatable {
  final String emailString;
  const Email({
    required this.emailString,
  });

  @override
  List<Object> get props => [emailString];
}

/// Represents an empty [Email]
class NullEmail extends Email {
  const NullEmail() : super(emailString: "_");
}
