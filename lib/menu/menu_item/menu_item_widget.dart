import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_item_model.dart';
export 'menu_item_model.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget({
    super.key,
    this.menuSize,
    this.hoveredMenuSize,
    bool? isMenuExpanded,
    required this.menuTitle,
    required this.menuIcon,
    required this.navigateTo,
    required this.showToAll,
  }) : this.isMenuExpanded = isMenuExpanded ?? false;

  final double? menuSize;
  final double? hoveredMenuSize;
  final bool isMenuExpanded;
  final String? menuTitle;
  final Widget? menuIcon;
  final Future Function()? navigateTo;
  final bool? showToAll;

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  late MenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.menuText = widget!.menuTitle;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget!.showToAll ?? true,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
        child: MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: SafeArea(
              child: Container(
                width: 150.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        (_model.paddingItem!) / 2,
                        0.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        (_model.paddingItem!) / 2,
                        0.0,
                      )),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.navigateTo?.call();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget!.menuIcon!,
                        if ((widget!.menuSize == widget!.hoveredMenuSize) &&
                            widget!.isMenuExpanded)
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                _model.menuText,
                                'menu',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ].divide(SizedBox(
                          width: valueOrDefault<double>(
                        _model.paddingItem,
                        16.0,
                      ))),
                    ),
                  ),
                ),
              ),
            ),
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.itemHoverHovered = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.itemHoverHovered = false);
          }),
        ),
      ),
    );
  }
}
