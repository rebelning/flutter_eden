import 'package:example/domain/entity/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/src/values/dimen/dimens.dart' as dimens;

class ItemView extends StatelessWidget {
  final MenuInfo? menu;
  final Function(BuildContext?, MenuInfo?)? onTapMenu;
  const ItemView({Key? key, this.menu, this.onTapMenu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _getItem(context, menu);
  }

  ///
  Widget _getItem(BuildContext context, MenuInfo? menu) {
    return InkWell(
      child: Container(
        decoration: ShapeDecoration(
          shape: Border(
            bottom: BorderSide(
                color: Theme.of(context).dividerColor, width: dimens.padding_0),
          ),
        ),
        padding: const EdgeInsets.all(dimens.padding_15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "${menu?.section}",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              ),
              flex: 7,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.right,
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(0),
                    iconSize: dimens.padding_15,
                    constraints: const BoxConstraints(
                        minWidth: 0, minHeight: dimens.min_height),
                    alignment: Alignment.centerRight,
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ),
      ),
      onTap: () {
        if (onTapMenu != null) {
          onTapMenu!(context, menu);
        }
      },
    );
  }
}
