/// [File] auth_data_source.dart
///
/// This file holds an abstract [AuthDataSource] class.
/// this will be implemented to interact with an external api for
/// auth operations
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import '../../models/user_model.dart';

abstract class AuthDataSource {
  /// Logs a user in
  ///
  /// Accepts [String] email, [String] password
  /// Returns [Map]
  Future<UserModel> loginUser(
      {required String email, required String password});

  Future<void> logoutUser();
}
