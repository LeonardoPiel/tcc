import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import 'dart:async';
import 'equipe_widget.dart' show EquipeWidget;
import 'package:flutter/material.dart';

class EquipeModel extends FlutterFlowModel<EquipeWidget> {
  ///  Local state fields for this page.

  UsuarioRow? usuario;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_nav_bar component.
  late AppNavBarModel appNavBarModel;
  // Model for side_menu component.
  late SideMenuModel sideMenuModel;
  Completer<List<ProjetoColaboradorRow>>? requestCompleter1;
  // State field(s) for colaborador_nome widget.
  FocusNode? colaboradorNomeFocusNode;
  TextEditingController? colaboradorNomeTextController;
  String? Function(BuildContext, String?)?
      colaboradorNomeTextControllerValidator;
  String? _colaboradorNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for colaborador_email widget.
  FocusNode? colaboradorEmailFocusNode;
  TextEditingController? colaboradorEmailTextController;
  String? Function(BuildContext, String?)?
      colaboradorEmailTextControllerValidator;
  String? _colaboradorEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // State field(s) for colaborador_senha widget.
  FocusNode? colaboradorSenhaFocusNode;
  TextEditingController? colaboradorSenhaTextController;
  String? Function(BuildContext, String?)?
      colaboradorSenhaTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  Completer<List<UsuarioRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - API (signup)] action in ButtonEditarCriar widget.
  ApiCallResponse? signup;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonAtribuirColaborador widget.
  List<ProjetoColaboradorRow>? queryProjetoColaborador;

  @override
  void initState(BuildContext context) {
    appNavBarModel = createModel(context, () => AppNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    colaboradorNomeTextControllerValidator =
        _colaboradorNomeTextControllerValidator;
    colaboradorEmailTextControllerValidator =
        _colaboradorEmailTextControllerValidator;
  }

  @override
  void dispose() {
    appNavBarModel.dispose();
    sideMenuModel.dispose();
    colaboradorNomeFocusNode?.dispose();
    colaboradorNomeTextController?.dispose();

    colaboradorEmailFocusNode?.dispose();
    colaboradorEmailTextController?.dispose();

    colaboradorSenhaFocusNode?.dispose();
    colaboradorSenhaTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
