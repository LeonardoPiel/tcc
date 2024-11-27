import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/menu_item/menu_item_widget.dart';
import 'side_menu_widget.dart' show SideMenuWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideMenuModel extends FlutterFlowModel<SideMenuWidget> {
  ///  Local state fields for this component.

  double paddingLayout = 12.0;

  double paddingItem = 12.0;

  double? iconSize = 24.0;

  double? menuSize = 90.0;

  double logoSize = 32.0;

  Color primaryColor = Color(4283120111);

  double? hoveredMenuSize = 250.0;

  bool isMenuExpanded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MenuHover widget.
  bool menuHoverHovered = false;
  // Model for menu_item component.
  late MenuItemModel menuItemModel1;
  // Model for menu_item component.
  late MenuItemModel menuItemModel2;
  // Model for menu_item component.
  late MenuItemModel menuItemModel3;
  // Model for menu_item component.
  late MenuItemModel menuItemModel4;
  // Model for menu_item component.
  late MenuItemModel menuItemModel5;
  // Model for menu_item component.
  late MenuItemModel menuItemModel6;

  @override
  void initState(BuildContext context) {
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
    menuItemModel4 = createModel(context, () => MenuItemModel());
    menuItemModel5 = createModel(context, () => MenuItemModel());
    menuItemModel6 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
    menuItemModel4.dispose();
    menuItemModel5.dispose();
    menuItemModel6.dispose();
  }

  /// Action blocks.
  Future expand(BuildContext context) async {
    menuSize = hoveredMenuSize;
    isMenuExpanded = true;
  }

  Future retract(BuildContext context) async {
    menuSize = 90.0;
    isMenuExpanded = false;
  }
}
