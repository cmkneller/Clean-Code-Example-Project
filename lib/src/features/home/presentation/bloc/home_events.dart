/// [File] home_events.dart
///
/// This file holds a number of [HomeEvent] classes used in
/// the home bloc
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///

import 'package:equatable/equatable.dart';

/// Base class for the home event
class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initialises the bloc
class InitHomeEvent extends HomeEvent {}

/// Logs the user out
class LogoutHomeEvent extends HomeEvent {}
