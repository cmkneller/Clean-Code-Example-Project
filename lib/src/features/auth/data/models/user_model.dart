/// [File] user_model.dart
///
/// This file holds a [UserModel] class.
/// This is used to represent a user within the data layer
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///

import 'package:equatable/equatable.dart';

import '../../../../core/shared/entities/url.dart';
import '../../domain/entities/email.dart';
import '../../domain/entities/user.dart';
import 'constants/user_constants.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String bio;
  final String photoUrl;
  const UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.photoUrl,
  });

  /// Creates an instance of [UserModel] from a json object
  ///
  /// Accepts [Map]
  /// Returns [UserModel]
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        photoUrl: map[UserConstants.photoUrl],
        name: map[UserConstants.name],
        email: map[UserConstants.email],
        bio: map[UserConstants.bio]);
  }

  /// Converts a [UserModel] to a Map
  ///
  /// Returns [Map]
  Map<String, dynamic> toJson() {
    return {
      UserConstants.photoUrl: photoUrl,
      UserConstants.name: name,
      UserConstants.email: email,
      UserConstants.bio: bio
    };
  }

  /// Creates a [UserModel] from a [User] entity
  ///
  /// Accepts [User]
  /// Returns [UserModel]
  factory UserModel.fromEntity(User entity) {
    return UserModel(
        name: entity.name,
        email: entity.email.emailString,
        bio: entity.bio,
        photoUrl: entity.photoUrl.urlString);
  }

  /// Creates a [User] from an [UserModel]
  ///
  /// Returns [User]
  User toEntity() {
    return User(
        name: name,
        email: Email(emailString: email),
        bio: bio,
        photoUrl: Url(urlString: photoUrl));
  }

  @override
  List<Object> get props => [name, email, bio];
}
