import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:shared_preferences/shared_preferences.dart';

///setting widget
class SettingWidget {
  Color _selectColor = Colors.blue;
  void _setTheme(BuildContext context, Color color) {
    int mode = 0;
    ThemeMode themeMode = ThemeMode.dark;
    if (color == Colors.blue) {
      themeMode = ThemeMode.light;
      mode = 0;
    } else if (color == Colors.black) {
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
