/// [File] custom_button.dart
///
/// This file holds a [CustomButton] class
///
/// [Author] Chris Kneller
/// [Date] March 5, 2024
library;

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback function;
  final bool activated;
  final bool isGradient;
  final bool isDark;
  final Color? color;

  /// Creates a GradientButton Widget
  ///
  /// Accepts a [double] Horizontal padding for the button, a [double] Vertical padding
  /// for the button, a [Widget] child, a [VoidCallback] to be executed when button is pressed
  /// and a [activated] Indicating whether the button is activated or not.
  const CustomButton(
      {super.key,
      required this.child,
      required this.function,
      required this.activated,
      required this.isGradient,
      required this.isDark,
      this.color});

  Color getColor(BuildContext context) {
    if (color != null) {
      return color!;
    }

    if (isDark) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.surfaceVariant;
    }
  }

  // Build method to create the widget hierarchy.
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    double padding = deviceSize.height * 0.025;

    // Ensure that the button takes the full width of its parent.
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Opacity(
        // Set the opacity based on the activation status.
        opacity: activated ? 1.0 : 0.6,
        child: Container(
          // Decorate the button with a gradient and rounded corners.
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: isGradient
                  ? LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.secondaryContainer,
                      ],
                    )
                  : null,
              color: getColor(context)),
          child: TextButton(
            // Attach the callback function to the button press event.

            onPressed: () {
              if (activated) {
                function();
              }
            },
            style: ButtonStyle(
              // Set the padding for the button.
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(padding),
              ),
            ),
            child: child, // Display the child widget
          ),
        ),
      ),
    );
  }
}
