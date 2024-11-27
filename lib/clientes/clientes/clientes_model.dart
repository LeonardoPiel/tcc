import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import 'clientes_widget.dart' show ClientesWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ClientesModel extends FlutterFlowModel<ClientesWidget> {
  ///  Local state fields for this page.

  ClienteRow? cliente;

  CredencialClienteRow? credencial;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_nav_bar component.
  late AppNavBarModel appNavBarModel;
  // Model for side_menu component.
  late SideMenuModel sideMenuModel;
  Completer<List<CredencialClienteRow>>? requestCompleter1;
  // State field(s) for cliente_nome widget.
  FocusNode? clienteNomeFocusNode;
  TextEditingController? clienteNomeTextController;
  String? Function(BuildContext, String?)? clienteNomeTextControllerValidator;
  // State field(s) for cliente_email widget.
  FocusNode? clienteEmailFocusNode;
  TextEditingController? clienteEmailTextController;
  String? Function(BuildContext, String?)? clienteEmailTextControllerValidator;
  // State field(s) for cliente_telefone widget.
  FocusNode? clienteTelefoneFocusNode;
  TextEditingController? clienteTelefoneTextController;
  final clienteTelefoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)?
      clienteTelefoneTextControllerValidator;
  // State field(s) for cliente_cidade widget.
  FocusNode? clienteCidadeFocusNode;
  TextEditingController? clienteCidadeTextController;
  String? Function(BuildContext, String?)? clienteCidadeTextControllerValidator;
  // State field(s) for cliente_endereco widget.
  FocusNode? clienteEnderecoFocusNode;
  TextEditingController? clienteEnderecoTextController;
  String? Function(BuildContext, String?)?
      clienteEnderecoTextControllerValidator;
  Completer<List<ClienteRow>>? requestCompleter2;
  // State field(s) for TextField_url widget.
  FocusNode? textFieldUrlFocusNode;
  TextEditingController? textFieldUrlTextController;
  String? Function(BuildContext, String?)? textFieldUrlTextControllerValidator;
  // State field(s) for TextField_username widget.
  FocusNode? textFieldUsernameFocusNode;
  TextEditingController? textFieldUsernameTextController;
  String? Function(BuildContext, String?)?
      textFieldUsernameTextControllerValidator;
  // State field(s) for TextField_password widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  // State field(s) for TextField_detalhes widget.
  FocusNode? textFieldDetalhesFocusNode;
  TextEditingController? textFieldDetalhesTextController;
  String? Function(BuildContext, String?)?
      textFieldDetalhesTextControllerValidator;

  @override
  void initState(BuildContext context) {
    appNavBarModel = createModel(context, () => AppNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    appNavBarModel.dispose();
    sideMenuModel.dispose();
    clienteNomeFocusNode?.dispose();
    clienteNomeTextController?.dispose();

    clienteEmailFocusNode?.dispose();
    clienteEmailTextController?.dispose();

    clienteTelefoneFocusNode?.dispose();
    clienteTelefoneTextController?.dispose();

    clienteCidadeFocusNode?.dispose();
    clienteCidadeTextController?.dispose();

    clienteEnderecoFocusNode?.dispose();
    clienteEnderecoTextController?.dispose();

    textFieldUrlFocusNode?.dispose();
    textFieldUrlTextController?.dispose();

    textFieldUsernameFocusNode?.dispose();
    textFieldUsernameTextController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();

    textFieldDetalhesFocusNode?.dispose();
    textFieldDetalhesTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
