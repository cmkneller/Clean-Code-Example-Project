/// [File] error_wrapper.dart
///
/// This file holds a [ErrorWrapper] widget
/// this consisits of a [Stack] and accepts a
/// [Scaffold]. The reason for this is to subscribe to a
/// ErrorBloc that will show a dialog whenerver an
/// error is pushed to the repository
///
/// [Author] Chris Kneller

/// [Date] September 4, 2023
library;

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/locator.dart';
import '../../../error/presentation/bloc/error_bloc.dart';
import '../../../error/presentation/bloc/error_event.dart';
import '../../../error/presentation/bloc/error_state.dart';

class ErrorWrapper extends StatelessWidget {
  final Widget widget;
  ErrorWrapper({required this.widget, super.key});
  final ErrorBloc errorBloc = getIt.get<ErrorBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorBloc, ErrorState>(
      bloc: errorBloc,
      listener: (context, state) async {
        if (state.errorStatus == ErrorStatus.error) {
          Flushbar(
            onStatusChanged: (status) {
              if (status == FlushbarStatus.DISMISSED) {
                errorBloc.add(DismissErrorEvent());
              }
            },
            messageText: Text(
              state.error.message,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.all(30),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Theme.of(context).colorScheme.error,
            message: state.error.message,
          ).show(context);
        }
      },
      child: Stack(
        children: [widget],
      ),
    );
  }
}
