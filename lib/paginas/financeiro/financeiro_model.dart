import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'financeiro_widget.dart' show FinanceiroWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinanceiroModel extends FlutterFlowModel<FinanceiroWidget> {
  ///  Local state fields for this page.

  MovimentacaoLancamentoViewRow? movimentacao;

  LancamentoTipoRow? lancamento;

  DateTime? dataLancamento;

  DateTime? dataVencimento;

  ClienteRow? cliente;

  ProjetoRow? projeto;

  UsuarioRow? usuario;

  String editarCriarLabel = 'Criar';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_nav_bar component.
  late AppNavBarModel appNavBarModel;
  // Model for side_menu component.
  late SideMenuModel sideMenuModel;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<LancamentoTipoRow>? queryLancamento;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ClienteRow>? queryClienteMovimentacao;
  // State field(s) for DropDown_cliente widget.
  int? dropDownClienteValue;
  FormFieldController<int>? dropDownClienteValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown_cliente widget.
  List<ClienteRow>? queryCliente;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ProjetoRow>? queryProjeto;
  // State field(s) for DropDown_projeto widget.
  int? dropDownProjetoValue;
  FormFieldController<int>? dropDownProjetoValueController;
  // State field(s) for DropDown_usuario widget.
  int? dropDownUsuarioValue;
  FormFieldController<int>? dropDownUsuarioValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown_usuario widget.
  List<UsuarioRow>? queryUsuario;
  // State field(s) for TextField_valor widget.
  FocusNode? textFieldValorFocusNode;
  TextEditingController? textFieldValorTextController;
  String? Function(BuildContext, String?)?
      textFieldValorTextControllerValidator;
  // State field(s) for DropDown_status_pagamento widget.
  bool? dropDownStatusPagamentoValue;
  FormFieldController<bool>? dropDownStatusPagamentoValueController;
  // State field(s) for TextField_descricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  // State field(s) for data_lancamento widget.
  FocusNode? dataLancamentoFocusNode;
  TextEditingController? dataLancamentoTextController;
  String? Function(BuildContext, String?)?
      dataLancamentoTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for data_vencimento widget.
  FocusNode? dataVencimentoFocusNode;
  TextEditingController? dataVencimentoTextController;
  String? Function(BuildContext, String?)?
      dataVencimentoTextControllerValidator;
  DateTime? datePicked2;
  Completer<List<MovimentacaoLancamentoViewRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    appNavBarModel = createModel(context, () => AppNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    appNavBarModel.dispose();
    sideMenuModel.dispose();
    textFieldValorFocusNode?.dispose();
    textFieldValorTextController?.dispose();

    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();

    dataLancamentoFocusNode?.dispose();
    dataLancamentoTextController?.dispose();

    dataVencimentoFocusNode?.dispose();
    dataVencimentoTextController?.dispose();
  }

  /// Action blocks.
  Future editaCriaLancamento(BuildContext context) async {
    if ((movimentacao != null) && (dropDownProjetoValue != null)) {
      if (lancamento?.tipo == 'Entrada') {
        await MovimentacaoTable().update(
          data: {
            'lancamento_tipo': lancamento?.id,
            'valor':
                functions.currencyRealDouble(textFieldValorTextController.text),
            'descricao': textFieldDescricaoTextController.text,
            'data_lancamento': supaSerialize<DateTime>(dataLancamento),
            'data_vencimento': supaSerialize<DateTime>(dataVencimento),
            'cliente_id': dropDownClienteValue,
            'projeto_id': dropDownProjetoValue,
            'usuario_id': dropDownUsuarioValue,
            'status_pagamento': dropDownStatusPagamentoValue,
          },
          matchingRows: (rows) => rows.eqOrNull(
            'id',
            movimentacao?.id,
          ),
        );
      } else {
        await MovimentacaoTable().update(
          data: {
            'lancamento_tipo': lancamento?.id,
            'valor': functions
                    .currencyRealDouble(textFieldValorTextController.text) *
                -1,
            'descricao': textFieldDescricaoTextController.text,
            'data_lancamento': supaSerialize<DateTime>(dataLancamento),
            'data_vencimento': supaSerialize<DateTime>(dataVencimento),
            'cliente_id': dropDownClienteValue,
            'projeto_id': dropDownProjetoValue,
            'usuario_id': dropDownUsuarioValue,
            'status_pagamento': dropDownStatusPagamentoValue,
          },
          matchingRows: (rows) => rows.eqOrNull(
            'id',
            movimentacao?.id,
          ),
        );
      }
    } else {
      if (lancamento?.tipo == 'Entrada') {
        await MovimentacaoTable().insert({
          'lancamento_tipo': lancamento?.id,
          'valor':
              functions.currencyRealDouble(textFieldValorTextController.text),
          'descricao': textFieldDescricaoTextController.text,
          'data_lancamento': supaSerialize<DateTime>(dataLancamento),
          'data_vencimento': supaSerialize<DateTime>(dataVencimento),
          'cliente_id': dropDownClienteValue,
          'projeto_id': dropDownProjetoValue,
          'usuario_id': dropDownClienteValue,
          'status_pagamento': dropDownStatusPagamentoValue,
        });
      } else {
        await MovimentacaoTable().insert({
          'lancamento_tipo': lancamento?.id,
          'valor':
              functions.currencyRealDouble(textFieldValorTextController.text) *
                  -1,
          'descricao': textFieldDescricaoTextController.text,
          'data_lancamento': supaSerialize<DateTime>(dataLancamento),
          'data_vencimento': supaSerialize<DateTime>(dataVencimento),
          'cliente_id': dropDownClienteValue,
          'projeto_id': dropDownProjetoValue,
          'usuario_id': dropDownClienteValue,
          'status_pagamento': dropDownStatusPagamentoValue,
        });
      }
    }
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
