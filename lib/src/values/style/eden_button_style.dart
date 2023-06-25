import 'package:flutter/material.dart';

///buttons style
class EdenButtonStyle {
  ///Text Button
  static ButtonStyle textButtonStyle(ColorScheme colorScheme) {
    return TextButton.styleFrom(
      primary: colorScheme.primary,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
  }

// ///Text Button
//   static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//     primary: Colors.black87,
//     minimumSize: Size(88, 36),
//     padding: EdgeInsets.symmetric(horizontal: 16.0),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(2.0)),
//     ),
//   );

  /// Elevated Button
  static ButtonStyle elevatedButtonStyle(ColorScheme colorScheme) {
    return ElevatedButton.styleFrom(
      onPrimary: colorScheme.onPrimary,
      primary: colorScheme.primary,
      minimumSize: const Size(88, 36),
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
  // static final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //   onPrimary: Colors.black87,
  //   primary: Colors.grey[300],
  //   minimumSize: Size(88, 36),
  //   padding: EdgeInsets.symmetric(horizontal: 16),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(2)),
  //   ),
  // );

  ///OutlineButton
  static ButtonStyle outlineButtonStyle(ColorScheme colorScheme) {
    return OutlinedButton.styleFrom(
      primary: colorScheme.primary,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(
              //color: Theme.of(context).colorScheme.primary,
              color: Colors.blue,
              width: 1,
            );
          }
          // Defer to the widget's default.
        },
      ),
    );
  }

  // static final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  //   primary: Colors.black87,
  //   minimumSize: Size(88, 36),
  //   padding: EdgeInsets.symmetric(horizontal: 16),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(2)),
  //   ),
  // ).copyWith(
  //   side: MaterialStateProperty.resolveWith<BorderSide?>(
  //     (Set<MaterialState> states) {
  //       if (states.contains(MaterialState.pressed))
  //         return BorderSide(
  //           //color: Theme.of(context).colorScheme.primary,
  //           color: Colors.blue,
  //           width: 1,
  //         );
  //       return null; // Defer to the widget's default.
  //     },
  //   ),
  // );
}
