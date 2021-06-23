import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

///setting widget
class SettingWidget {
  void setTheme(BuildContext context) {
    // ModalWidget.show(
    //   context,
    //   title: "Theme",
    //   confirmLabel: "confirm",
    //   cancelLabel: "cancel",
    Color color=Colors.blue;
    showModalBottomSheet<Widget>(
        context: context,
        builder: (context) {
          return Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(12),
              child: ColorPickerWidget(
                colorValue:color ,
                onColorSelection: (color) {
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
              setTheme(context);
            },
          ),
        ],
      ),
    );
  }
}
