/// [File] home_state.dart
///
/// This file holds a [HomeState] class used in
/// the home bloc
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024

import '../../../../core/utility/submission_status.dart';
import '../../../auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final AsyncStatus status;
  final User user;
  const HomeState({
    required this.status,
    required this.user,
  });

  /// Creates an initial state
  ///
  /// Returns [HomeState]
  factory HomeState.initial() => const HomeState(
        status: AsyncStatus.ready,
        user: NullUser(),
      );

  @override
  List<Object> get props => [
        status,
        user,
      ];

  /// Creates a copy of the home state
  ///
  /// Accepts any field and...
  /// returns a copied version of [HomeState] with the fields changed
  HomeState copyWith({
    AsyncStatus? status,
    User? user,
  }) {
    return HomeState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
