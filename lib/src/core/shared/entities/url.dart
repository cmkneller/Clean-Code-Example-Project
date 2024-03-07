/// [File] url.dart
///
/// This file holds the [Url] class, which is an entity
/// representing a validated web address
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
///
library;

import 'package:equatable/equatable.dart';

class Url extends Equatable {
  final String urlString;
  const Url({
    required this.urlString,
  });

  @override
  List<Object?> get props => [urlString];
}

class NullUrl extends Url {
  const NullUrl() : super(urlString: "");
}
