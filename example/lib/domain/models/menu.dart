class Menu {
  String menuId;
  String section;
  String action;
  Menu({this.menuId, this.section,this.action});

  @override
  String toString() {
    return 'Menu{menuId: $menuId, section: $section, action: $action}';
  }
}
