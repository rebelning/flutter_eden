import 'package:example/app/modules/account/views/item_view.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:flutter/material.dart';

class HomeView {
  Widget renderItemView(
    BuildContext context,
    List<MenuInfo>? sourceList,
    Function(MenuInfo?)? onMenu,
  ) {
    return ListView.builder(
      itemBuilder: (context, index) {
        MenuInfo? menuInfo = sourceList![index];
        return ItemView(
          menu: menuInfo,
          onTapMenu: (_, info) {
            if (onMenu != null) {
              onMenu(menuInfo);
            }
          },
        );
      },
      itemCount: sourceList?.length,
    );
  }
}
