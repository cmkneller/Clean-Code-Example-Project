/// [File] impl_auth_data_source.dart
///
/// This file holds an implemented [AuthDataSource] class.
/// used to interact with a specific external api for
/// auth operations
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///
library;

import '../../../../../config/locator.dart';
import '../../models/user_model.dart';
import '../../../../../../mocked/fake_api.dart';

import '../abstract/auth_data_source.dart';

class ImplAuthDataSource implements AuthDataSource {
  final FakeAPI api = getIt.get<FakeAPI>();

  /// Overides loginUser abstract method
  ///
  /// Accepts [String] email, [String] password
  /// Returns [UserModel]
  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    Map<String, dynamic> userData = await api.loginUser(email, password);
    return UserModel.fromJson(userData);
  }

  /// Logs the current user out
  @override
  Future<void> logoutUser() async {
    api.logoutUser();
  }
}
