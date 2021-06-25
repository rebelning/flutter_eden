import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:shared_preferences/shared_preferences.dart';

///setting widget
class SettingWidget {
  void _setTheme(BuildContext context, Color color) {
    int mode = 0;
    ThemeMode themeMode = ThemeMode.dark;
    if (color == EdenThemeData.lightColorScheme.primary) {
      themeMode = ThemeMode.light;
      mode = 0;
    } else if (color == EdenThemeData.darkColorScheme.primary) {
      themeMode = ThemeMode.dark;
      mode = 1;
    } else {
      themeMode = ThemeMode.system;
      mode = 0;
    }
    final options = EdenOptions.of(context);
    EdenOptions.update(
      context,
      options.copyWith(themeMode: themeMode),
    );
    setThemeMode(mode);
  }

  ///set theme mode
  void setThemeMode(int mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("themeMode", mode).then((value) {
      DebugLog.log("setThemeMode", "$value");
    });
  }

  Color getDefaultThemeColor(BuildContext context) {
    ThemeMode? themeMode = EdenOptions.of(context).themeMode;
    Color themeColor = EdenThemeData.lightColorScheme.primary;
    switch (themeMode ?? ThemeMode.light) {
      case ThemeMode.dark:
        themeColor = EdenThemeData.darkColorScheme.primary;
        break;
      case ThemeMode.light:
        themeColor = EdenThemeData.lightColorScheme.primary;
        break;
      case ThemeMode.system:
        themeColor = EdenThemeData.lightColorScheme.primary;
        break;
    }
    return themeColor;
  }

  void _selectSheet(BuildContext context) {
    Color _selectColor = getDefaultThemeColor(context);
    final themeColors = <Color>{
      EdenThemeData.lightColorScheme.primary,
      EdenThemeData.darkColorScheme.primary,
    };
    showModalBottomSheet<Widget>(
        context: context,
        builder: (context) {
          return Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(12),
              child: ColorPickerWidget(
                colorValue: _selectColor,
                colors: themeColors,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            
            child: Text(
              "theme",
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () {
              _selectSheet(context);
            },
          ),
        ],
      ),
    );
  }
}
