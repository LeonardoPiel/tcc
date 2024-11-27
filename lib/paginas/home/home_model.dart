import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/clientes/componente_credenciais/componente_credenciais_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import '/projetos/componente_tarefa_acao/componente_tarefa_acao_widget.dart';
import 'dart:math';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
