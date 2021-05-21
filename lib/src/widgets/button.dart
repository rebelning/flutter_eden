import 'package:flutter/material.dart';
import 'package:flutter_eden/src/values/color/colors.dart' as colors;
import 'package:flutter_eden/src/widgets/text.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final bool transparent;
  final IconData icon;
  final bool facebook;

  final double _elevation = 3;

  const ButtonWidget({
    Key key, 
    this.label,
    this.onPress,
    this.disabled,
    this.transparent,
    this.icon,
    this.facebook
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    Color backgroundColor = colors.accentColor;
    Color borderColor = colors.accentColor;
    Color textColor = Colors.white;

    if (transparent == true) {
      backgroundColor = colors.btnBackgroundColor;
      borderColor = colors.lineColor;
      textColor = colors.textColor;
    } else {
      backgroundColor = colors.accentLightColor;
      borderColor = colors.accentLightColor;
      textColor = Colors.white;
    }

    if (facebook == true) {
      backgroundColor = colors.facebookColor;
      borderColor = colors.facebookColor;
      textColor = Colors.white;
    }
    
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
        shape: RoundedRectangleBorder(
          side: BorderSide( color: borderColor ),
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: action,
        elevation: _elevation,
        color: backgroundColor,
        child: TextWidget(text: label.toUpperCase() ?? "Label", small: true, color: textColor )
      ),
    );
  }
}