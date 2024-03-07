/// [File] fake_api.dart
///
/// This file holds a [FakeAPI] class.
/// designed to mock the functionality of an external api
/// auth operations
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

class FakeAPI {
  /// List of users
  List<Map<String, dynamic>> userList = [
    {
      "name": "Chris",
      "photoUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Tom_Cruise_by_Gage_Skidmore_2.jpg/1024px-Tom_Cruise_by_Gage_Skidmore_2.jpg",
      "email": "chris@chris.com",
      "bio": "Some developer, or whatever",
      "password": "Password12!"
    }
  ];

  /// Logs in a user
  ///
  /// Accepts [String] email, [String] password
  ///
  /// Returns [Map]
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 5), () {});
    for (Map<String, dynamic> user in userList) {
      if (user["email"] == email && user["password"] == password) {
        return user;
      }
    }
    throw Exception("No User Found, please double check your email");
  }

  void logoutUser() {}
}
