import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///setting widget
class SettingWidget {
  Color _selectColor = Colors.blue;
  void _setTheme(BuildContext context, Color color) {
    
    ThemeMode themeMode = ThemeMode.dark;
    if (color == Colors.blue) {
      themeMode = ThemeMode.light;
    } else if (color == Colors.black) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }
    final options = EdenOptions.of(context);
    EdenOptions.update(
      context,
      options.copyWith(themeMode: themeMode),
    );
  }

  void _selectSheet(BuildContext context) {
    showModalBottomSheet<Widget>(
        context: context,
        builder: (context) {
          return Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(12),
              child: ColorPickerWidget(
                colorValue: _selectColor,
                onColorSelection: (color) {
                  _selectColor = color;
                  _setTheme(context, color);
                  Navigator.pop(context);
                },
              ));
        });
  }

  Widget setting(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          MaterialButton(
            child: Text(
              "theme",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              _selectSheet(context);
            },
          ),
        ],
      ),
    );
  }
}
