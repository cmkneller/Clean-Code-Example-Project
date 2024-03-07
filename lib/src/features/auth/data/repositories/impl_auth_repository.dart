/// [File] impl_auth_repository.dart
///
/// This file holds an implemented [AuthRepository] class
///
/// [Author] Chris Kneller
/// [support] chris@swiftpitch.app
/// [Date] March 5, 2024
library;

import '../../../../config/locator.dart';
import '../../domain/entities/email.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/abstract/auth_data_source.dart';
import '../models/user_model.dart';

class ImplAuthRepository implements AuthRepository {
  final AuthDataSource dataSource = getIt.get<AuthDataSource>();
  @override
  User currUser = const NullUser();

  /// Overrides abstract loginUser method
  ///
  /// Accepts [Email] email, [String] password
  /// Returns [User] entity
  @override
  Future<User> loginUser(
      {required Email email, required String password}) async {
    UserModel userModel = await dataSource.loginUser(
        email: email.emailString, password: password);

    User userEntity = userModel.toEntity();
    currUser = userEntity;
    return currUser;
  }

  @override
  void logOut() async {
    currUser = const NullUser();
    await dataSource.logoutUser();
  }

  /// Sets the current user
  ///
  /// Accepts [User] user
  @override
  void setCurrUser(User user) {
    currUser = user;
  }
}
