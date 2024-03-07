/// [File] auth_repository.dart
///
/// This file holds an abstract repository to communicate with the data layer
/// of the auth feature
///
/// [Author] Chris Kneller

/// [Date] March 5, 2024

import '../entities/email.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  /// Logs in a user.
  ///
  /// Accepts [Email] email, [String] password
  /// Returns [User] entity
  Future<User> loginUser({required Email email, required String password});

  /// Sets the current user
  void setCurrUser(User user);

  /// Fetches the current user
  User get currUser;

  void logOut();
}
