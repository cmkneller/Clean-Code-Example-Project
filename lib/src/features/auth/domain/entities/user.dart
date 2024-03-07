/// [File] email.dart
///
/// This file holds a [User] enity. This is used to represent
/// an user in the domain and presentation layer of the application
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///

import 'package:equatable/equatable.dart';

import '../../../../core/shared/entities/url.dart';
import 'email.dart';

class User extends Equatable {
  final String name;
  final Email email;
  final String bio;
  final Url photoUrl;

  const User(
      {required this.name,
      required this.email,
      required this.bio,
      required this.photoUrl});

  @override
  List<Object> get props => [name, email, bio];
}

/// Represents an empty [User]
class NullUser extends User {
  const NullUser()
      : super(
            bio: "_",
            name: "_",
            photoUrl: const NullUrl(),
            email: const NullEmail());
}
