import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/menu_item/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_menu_model.dart';
export 'side_menu_model.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({
    super.key,
    String? selectedNav,
    this.menuIcon,
  }) : this.selectedNav = selectedNav ?? 'home';

  final String selectedNav;
  final Widget? menuIcon;

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  late SideMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: FutureBuilder<List<UsuarioRow>>(
          future: UsuarioTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'user',
              currentUserUid,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<UsuarioRow> containerUsuarioRowList = snapshot.data!;

            final containerUsuarioRow = containerUsuarioRowList.isNotEmpty
                ? containerUsuarioRowList.first
                : null;

            return SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(8.0),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  width: _model.menuSize,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(valueOrDefault<double>(
                      _model.paddingLayout,
                      0.0,
                    )),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: wrapWithModel(
                            model: _model.menuItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuItemWidget(
                              menuSize: _model.menuSize,
                              hoveredMenuSize: _model.hoveredMenuSize,
                              isMenuExpanded: _model.isMenuExpanded,
                              menuTitle: 'Inicio',
                              menuIcon: Icon(
                                Icons.home,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showToAll: true,
                              navigateTo: () async {
                                context.pushNamed('Home');
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: wrapWithModel(
                            model: _model.menuItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuItemWidget(
                              menuSize: _model.menuSize,
                              hoveredMenuSize: _model.hoveredMenuSize,
                              isMenuExpanded: _model.isMenuExpanded,
                              menuTitle: 'Projetos',
                              menuIcon: Icon(
                                Icons.folder,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showToAll: containerUsuarioRow?.nivelId == 1,
                              navigateTo: () async {
                                context.pushNamed('Projetos');
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: wrapWithModel(
                            model: _model.menuItemModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuItemWidget(
                              menuSize: _model.menuSize,
                              hoveredMenuSize: _model.hoveredMenuSize,
                              isMenuExpanded: _model.isMenuExpanded,
                              menuTitle: 'Biblioteca',
                              menuIcon: FaIcon(
                                FontAwesomeIcons.bookReader,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showToAll: containerUsuarioRow?.nivelId == 1,
                              navigateTo: () async {
                                context.pushNamed('Biblioteca');
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: wrapWithModel(
                            model: _model.menuItemModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuItemWidget(
                              menuSize: _model.menuSize,
                              hoveredMenuSize: _model.hoveredMenuSize,
                              isMenuExpanded: _model.isMenuExpanded,
                              menuTitle: 'Clientes',
                              menuIcon: Icon(
                                Icons.emoji_people,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showToAll: containerUsuarioRow?.nivelId == 1,
                              navigateTo: () async {
                                context.pushNamed('Clientes');
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: wrapWithModel(
                            model: _model.menuItemModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuItemWidget(
                              menuSize: _model.menuSize,
                              hoveredMenuSize: _model.hoveredMenuSize,
                              isMenuExpanded: _model.isMenuExpanded,
                              menuTitle: 'Equipe',
                              menuIcon: FaIcon(
                                FontAwesomeIcons.usersCog,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showToAll: containerUsuarioRow?.nivelId == 1,
                              navigateTo: () async {
                                context.pushNamed('Equipe');
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: wrapWithModel(
                            model: _model.menuItemModel6,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuItemWidget(
                              menuSize: _model.menuSize,
                              hoveredMenuSize: _model.hoveredMenuSize,
                              isMenuExpanded: _model.isMenuExpanded,
                              menuTitle: 'Financeiro',
                              menuIcon: Icon(
                                Icons.attach_money_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              showToAll: containerUsuarioRow?.nivelId == 1,
                              navigateTo: () async {
                                context.pushNamed('Financeiro');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'AuthLogin', context.mounted);
                                },
                                child: Icon(
                                  Icons.exit_to_app,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.menuHoverHovered = true);
          await _model.expand(context);
          safeSetState(() {});
        }),
        onExit: ((event) async {
          safeSetState(() => _model.menuHoverHovered = false);
          await _model.retract(context);
          safeSetState(() {});
        }),
      ),
    );
  }
}
