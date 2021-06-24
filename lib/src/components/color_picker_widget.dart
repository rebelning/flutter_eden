// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_eden/src/widgets/color_picker.dart';



// The panel for editing a board point.
// @immutable
class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    Key? key,
    this.colorValue,
    this.onColorSelection,
  }) : super(key: key);
  final Color? colorValue;
  final ValueChanged<Color>? onColorSelection;

  @override
  Widget build(BuildContext context) {
    final boardPointColors = <Color>{
      Colors.green.shade400,
      Colors.black,
      Colors.blue,
      // GalleryThemeData.darkColorScheme.primary,
      // GalleryThemeData.darkColorScheme.primaryVariant,
      // GalleryThemeData.darkColorScheme.secondary,
      
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       
        ColorPicker(
          colors: boardPointColors,
          selectedColor: colorValue,
          onColorSelection: onColorSelection,
        ),
      ],
    );
  }
}
