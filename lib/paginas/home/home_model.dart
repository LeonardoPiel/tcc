import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  ProjetoRow? projeto;

  List<FaseProjetoRow> faseProjeto = [];
  void addToFaseProjeto(FaseProjetoRow item) => faseProjeto.add(item);
  void removeFromFaseProjeto(FaseProjetoRow item) => faseProjeto.remove(item);
  void removeAtIndexFromFaseProjeto(int index) => faseProjeto.removeAt(index);
  void insertAtIndexInFaseProjeto(int index, FaseProjetoRow item) =>
      faseProjeto.insert(index, item);
  void updateFaseProjetoAtIndex(int index, Function(FaseProjetoRow) updateFn) =>
      faseProjeto[index] = updateFn(faseProjeto[index]);

  bool dialogOpen = false;

  ///  State fields for stateful widgets in this page.

  // Model for app_nav_bar component.
  late AppNavBarModel appNavBarModel;
  // Model for side_menu component.
  late SideMenuModel sideMenuModel;
  // Stores action output result for [Backend Call - Query Rows] action in Container_project widget.
  List<FaseProjetoRow>? queryFaseProjeto;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<ClienteRow>? queryCliente;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    appNavBarModel = createModel(context, () => AppNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    appNavBarModel.dispose();
    sideMenuModel.dispose();
    tabBarController?.dispose();
  }
}
