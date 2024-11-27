import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import 'dart:math';
import 'biblioteca_widget.dart' show BibliotecaWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BibliotecaModel extends FlutterFlowModel<BibliotecaWidget> {
  ///  Local state fields for this page.

  ProjetoRow? projeto;

  BibliotecaProjetoRow? biblioteca;

  AnexoBibliotecaRow? anexo;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_nav_bar component.
  late AppNavBarModel appNavBarModel;
  // Model for side_menu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Container_projectAtivo widget.
  List<FaseProjetoRow>? queryFaseProjetoAtivo;
  // State field(s) for biblioteca_titulo widget.
  FocusNode? bibliotecaTituloFocusNode;
  TextEditingController? bibliotecaTituloTextController;
  String? Function(BuildContext, String?)?
      bibliotecaTituloTextControllerValidator;
  String? _bibliotecaTituloTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome da fase';
    }

    return null;
  }

  // State field(s) for biblioteca_comentario widget.
  FocusNode? bibliotecaComentarioFocusNode;
  TextEditingController? bibliotecaComentarioTextController;
  String? Function(BuildContext, String?)?
      bibliotecaComentarioTextControllerValidator;
  // Stores action output result for [Validate Form] action in ButtonEditarCriar widget.
  bool? validateForm;
  Completer<List<AnexoBibliotecaRow>>? requestCompleter;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    appNavBarModel = createModel(context, () => AppNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    bibliotecaTituloTextControllerValidator =
        _bibliotecaTituloTextControllerValidator;
  }

  @override
  void dispose() {
    appNavBarModel.dispose();
    sideMenuModel.dispose();
    tabBarController?.dispose();
    bibliotecaTituloFocusNode?.dispose();
    bibliotecaTituloTextController?.dispose();

    bibliotecaComentarioFocusNode?.dispose();
    bibliotecaComentarioTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
