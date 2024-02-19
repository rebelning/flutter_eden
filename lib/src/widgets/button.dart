import 'package:flutter_eden/eden.dart';

enum ButtonType {
  ELEVATED,
  TEXT,
  OUTLINED,
}

class ButtonWidget extends StatelessWidget {
  final String? label;
  final ButtonType? buttonType;
  final Function()? onPressed;
  final bool? disabled;
  final bool? transparent;
  final IconData? icon;
  final Size? minimumSize;
  final double _elevation = 0;
  final Color? onPrimary;
  final Color? primary;
  final double? fontSize;
  final double? fontHeight;

  const ButtonWidget({
    Key? key,
    this.label,
    this.buttonType,
    this.onPressed,
    this.disabled,
    this.transparent,
    this.icon,
    this.minimumSize,
    this.onPrimary,
    this.primary,
    this.fontSize,
    this.fontHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPressed;

    if (kIsDark == true) {}

    return Padding(
      padding: EdgeInsets.only(top: 15.0.rpx),
      child: buildButtonView(),
    );
  }

  Widget? buildButtonView() {
    switch (buttonType) {
      case ButtonType.ELEVATED:
        return ElevatedButton(
          onPressed: onPressed,
          style: _elevatedButtonStyle(),
          child: buttonText(),
        );
      case ButtonType.TEXT:
        return TextButton(
          onPressed: onPressed,
          style: _textButtonStyle(),
          child: buttonText(),
        );
      case ButtonType.OUTLINED:
        return OutlinedButton(
          onPressed: onPressed,
          // style: _outlinedButtonStyle(),
          style: disabled == true
              ? _outlinedNormalButtonStyle()
              : _outlinedButtonStyle(),
          child: buttonText(),
        );
      default:
        return ElevatedButton(
          onPressed: onPressed,
          style: _elevatedButtonStyle(),
          child: buttonText(),
        );
    }
  }

  Widget buttonText() {
    return Text(
      label ?? "Label",
    );
  }

  ButtonStyle _elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      // onPrimary: onPrimary ?? EdenColors.colorfafafa,
      // primary: primary ?? EdenColors.color1077FE,
      backgroundColor: primary ?? EdenColors.color1077FE,
      minimumSize: Size(88.rpx, 36.rpx),
      elevation: _elevation,
      padding: EdgeInsets.symmetric(horizontal: 20.rpx, vertical: 20.rpx),
      textStyle: TextStyle(
        fontSize: fontSize ?? 26.rpx,
        fontWeight: FontWeight.w500,
        color: onPrimary,
        height: fontHeight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(44.rpx)),
      ),
    );
  }

  ButtonStyle _textButtonStyle() {
    return TextButton.styleFrom(
      // primary: primary ?? EdenColors.color8b8b8b,
      backgroundColor: primary ?? EdenColors.color8b8b8b,
      minimumSize: Size(88.rpx, 60.rpx),
      padding: EdgeInsets.symmetric(horizontal: 16.0.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.rpx)),
      ),
    );
  }

  ///normal
  ButtonStyle _outlinedNormalButtonStyle() {
    return OutlinedButton.styleFrom(
      // primary: primary ?? EdenColors.colorF5F9FD,
      backgroundColor: EdenColors.colorF5F9FD,
      minimumSize: Size(64.rpx, 64.rpx),
      // padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.rpx)),
      ),
      textStyle: TextStyle(
        color: EdenColors.colorB0B4B8,
        fontSize: fontSize ?? 26.rpx,
        height: 1.4,
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              //color: Theme.of(context).colorScheme.primary,
              color: EdenColors.colorF5F9FD,
              width: 1.rpx,
            );
          }
          return BorderSide(
            //color: Theme.of(context).colorScheme.primary,
            color: EdenColors.colorF5F9FD,
            width: 1.rpx,
          ); // Defer to the widget's default.
        },
      ),
    );
  }

  ButtonStyle _outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
      // primary: primary ?? EdenColors.colorF0F9FF,
      backgroundColor: EdenColors.color1077FE,
      minimumSize: Size(64.rpx, 64.rpx),
      // padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.rpx)),
      ),
      textStyle: TextStyle(
        color: EdenColors.color2C83F5,
        fontSize: fontSize ?? 26.rpx,
        height: 1.4,
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              //color: Theme.of(context).colorScheme.primary,
              color: EdenColors.colorfafafa,
              width: 1.rpx,
            );
          }
          return BorderSide(
            //color: Theme.of(context).colorScheme.primary,
            color: EdenColors.colorD1EBFF,
            width: 1.rpx,
          ); // Defer to the widget's default.
        },
      ),
    );
  }
}
