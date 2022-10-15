import 'package:flutter/material.dart';

import 'card_view.dart';
import 'text.dart';

class NavBottomSheetWidget extends StatelessWidget {
  final String? buttonLeft;
  final String? buttonRight;
  final Color? textColor;
  final Function(dynamic)? actionButtonLeft;
  final Widget? pageToCall;

  const NavBottomSheetWidget({
    Key? key,
    this.buttonLeft,
    this.buttonRight,
    this.textColor,
    this.actionButtonLeft,
    this.pageToCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CardViewWidget(
          width: double.infinity,
          height: 63,
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: () {
                  if (actionButtonLeft != null) {
                    actionButtonLeft!(context);
                  }
                },
                child: TextWidget(
                  text: buttonLeft,
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                  onPressed: () {},
                  child: TextWidget(color: textColor, text: buttonRight)),
            ),
          )),
    );
  }
}
