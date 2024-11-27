import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_item_widget.dart' show MenuItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuItemModel extends FlutterFlowModel<MenuItemWidget> {
  ///  Local state fields for this component.

  double? paddingItem = 16.0;

  double? iconSize;

  String? menuText;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ItemHover widget.
  bool itemHoverHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
