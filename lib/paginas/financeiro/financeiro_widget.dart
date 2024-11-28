import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'financeiro_model.dart';
export 'financeiro_model.dart';

class FinanceiroWidget extends StatefulWidget {
  const FinanceiroWidget({super.key});

  @override
  State<FinanceiroWidget> createState() => _FinanceiroWidgetState();
}

class _FinanceiroWidgetState extends State<FinanceiroWidget> {
  late FinanceiroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinanceiroModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.dropDownClienteValueController?.value = 0;
      });
      safeSetState(() {
        _model.dropDownProjetoValueController?.value = 0;
      });
    });

    _model.textFieldValorTextController ??= TextEditingController();
    _model.textFieldValorFocusNode ??= FocusNode();

    _model.textFieldDescricaoTextController ??= TextEditingController();
    _model.textFieldDescricaoFocusNode ??= FocusNode();

    _model.dataLancamentoTextController ??= TextEditingController();
    _model.dataLancamentoFocusNode ??= FocusNode();

    _model.dataVencimentoTextController ??= TextEditingController();
    _model.dataVencimentoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.appNavBarModel,
              updateCallback: () => safeSetState(() {}),
              child: const AppNavBarWidget(),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.sideMenuModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const SideMenuWidget(
                      selectedNav: 'financeiro',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 12.0),
                              child: Text(
                                'Financeiro',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<
                                        List<MovimentacaoLancamentoViewRow>>(
                                      future: (_model.requestCompleter ??= Completer<
                                              List<
                                                  MovimentacaoLancamentoViewRow>>()
                                            ..complete(
                                                MovimentacaoLancamentoViewTable()
                                                    .queryRows(
                                              queryFn: (q) => q.order(
                                                  'data_lancamento',
                                                  ascending: true),
                                              limit: 10,
                                            )))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<MovimentacaoLancamentoViewRow>
                                            containerMovimentacaoMovimentacaoLancamentoViewRowList =
                                            snapshot.data!;

                                        return Container(
                                          height: 700.0,
                                          constraints: const BoxConstraints(
                                            maxWidth: 700.0,
                                          ),
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              if (containerMovimentacaoMovimentacaoLancamentoViewRowList
                                                  .isNotEmpty) {
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  12.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              'Total no período: ${valueOrDefault<String>(
                                                                formatNumber(
                                                                  (List<double>
                                                                      valor) {
                                                                    return valor.reduce((total,
                                                                            valor) =>
                                                                        total +
                                                                        valor);
                                                                  }(containerMovimentacaoMovimentacaoLancamentoViewRowList
                                                                      .map((e) =>
                                                                          e.valor)
                                                                      .withoutNulls
                                                                      .toList()),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'R\$ ',
                                                                ),
                                                                '0',
                                                              )}',
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final containerMovimentacaoVar =
                                                              containerMovimentacaoMovimentacaoLancamentoViewRowList
                                                                  .toList();

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                containerMovimentacaoVar
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                const SizedBox(
                                                                    height:
                                                                        8.0),
                                                            itemBuilder: (context,
                                                                containerMovimentacaoVarIndex) {
                                                              final containerMovimentacaoVarItem =
                                                                  containerMovimentacaoVar[
                                                                      containerMovimentacaoVarIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (_model
                                                                          .movimentacao
                                                                          ?.id ==
                                                                      containerMovimentacaoVarItem
                                                                          .id) {
                                                                    _model.movimentacao =
                                                                        null;
                                                                    _model.lancamento =
                                                                        null;
                                                                    _model.dataLancamento =
                                                                        null;
                                                                    _model.dataVencimento =
                                                                        null;
                                                                    _model.cliente =
                                                                        null;
                                                                    _model.projeto =
                                                                        null;
                                                                    _model.editarCriarLabel =
                                                                        'Criar';
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .textFieldValorTextController
                                                                          ?.clear();
                                                                      _model
                                                                          .textFieldDescricaoTextController
                                                                          ?.clear();
                                                                      _model
                                                                          .dataLancamentoTextController
                                                                          ?.clear();
                                                                      _model
                                                                          .dataVencimentoTextController
                                                                          ?.clear();
                                                                    });
                                                                  } else {
                                                                    _model.queryLancamento =
                                                                        await LancamentoTipoTable()
                                                                            .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'id',
                                                                        containerMovimentacaoVarItem
                                                                            .lancamentoTipo,
                                                                      ),
                                                                    );
                                                                    _model.queryClienteMovimentacao =
                                                                        await ClienteTable()
                                                                            .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eqOrNull(
                                                                        'id',
                                                                        containerMovimentacaoVarItem
                                                                            .clienteId,
                                                                      ),
                                                                    );
                                                                    _model.movimentacao =
                                                                        containerMovimentacaoVarItem;
                                                                    _model.lancamento = _model
                                                                        .queryLancamento
                                                                        ?.first;
                                                                    _model.cliente = _model
                                                                        .queryClienteMovimentacao
                                                                        ?.first;
                                                                    _model.editarCriarLabel =
                                                                        'Editar';
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model.textFieldValorTextController
                                                                              ?.text =
                                                                          formatNumber(
                                                                        containerMovimentacaoVarItem
                                                                            .valor!,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                        currency:
                                                                            'R\$ ',
                                                                      );
                                                                      _model
                                                                          .textFieldValorFocusNode
                                                                          ?.requestFocus();
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .addPostFrameCallback(
                                                                              (_) {
                                                                        _model
                                                                            .textFieldValorTextController
                                                                            ?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .textFieldValorTextController!
                                                                              .text
                                                                              .length,
                                                                        );
                                                                      });
                                                                    });
                                                                    safeSetState(
                                                                        () {
                                                                      _model.textFieldDescricaoTextController
                                                                              ?.text =
                                                                          containerMovimentacaoVarItem
                                                                              .descricao!;
                                                                      _model
                                                                          .textFieldDescricaoFocusNode
                                                                          ?.requestFocus();
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .addPostFrameCallback(
                                                                              (_) {
                                                                        _model
                                                                            .textFieldDescricaoTextController
                                                                            ?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .textFieldDescricaoTextController!
                                                                              .text
                                                                              .length,
                                                                        );
                                                                      });
                                                                    });
                                                                    safeSetState(
                                                                        () {
                                                                      _model.dataLancamentoTextController
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        "d/M/y",
                                                                        containerMovimentacaoVarItem
                                                                            .dataLancamento!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                      _model
                                                                          .dataLancamentoFocusNode
                                                                          ?.requestFocus();
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .addPostFrameCallback(
                                                                              (_) {
                                                                        _model
                                                                            .dataLancamentoTextController
                                                                            ?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .dataLancamentoTextController!
                                                                              .text
                                                                              .length,
                                                                        );
                                                                      });
                                                                    });
                                                                    safeSetState(
                                                                        () {
                                                                      _model.dataVencimentoTextController
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        "d/M/y",
                                                                        containerMovimentacaoVarItem
                                                                            .dataVencimento!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                      _model
                                                                          .dataVencimentoFocusNode
                                                                          ?.requestFocus();
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .addPostFrameCallback(
                                                                              (_) {
                                                                        _model
                                                                            .dataVencimentoTextController
                                                                            ?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .dataVencimentoTextController!
                                                                              .text
                                                                              .length,
                                                                        );
                                                                      });
                                                                    });
                                                                    _model.dataLancamento =
                                                                        containerMovimentacaoVarItem
                                                                            .dataLancamento;
                                                                    _model.dataVencimento =
                                                                        containerMovimentacaoVarItem
                                                                            .dataVencimento;
                                                                    safeSetState(
                                                                        () {});
                                                                    safeSetState(
                                                                        () {
                                                                      _model.dropDownClienteValueController
                                                                              ?.value =
                                                                          containerMovimentacaoVarItem
                                                                              .clienteId!;
                                                                    });
                                                                    safeSetState(
                                                                        () {
                                                                      _model.dropDownProjetoValueController
                                                                              ?.value =
                                                                          containerMovimentacaoVarItem
                                                                              .projetoId!;
                                                                    });
                                                                    safeSetState(
                                                                        () {
                                                                      _model.dropDownUsuarioValueController
                                                                              ?.value =
                                                                          containerMovimentacaoVarItem
                                                                              .usuarioId!;
                                                                    });
                                                                    safeSetState(
                                                                        () {
                                                                      _model.dropDownStatusPagamentoValueController
                                                                              ?.value =
                                                                          containerMovimentacaoVarItem
                                                                              .statusPagamento!;
                                                                    });
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: containerMovimentacaoVarItem.id ==
                                                                            _model
                                                                                .movimentacao?.id
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        8.0,
                                                                        4.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              dateTimeFormat(
                                                                                                "d/M/y",
                                                                                                containerMovimentacaoVarItem.dataLancamento!,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: containerMovimentacaoVarItem.id == _model.movimentacao?.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              dateTimeFormat(
                                                                                                "d/M/y",
                                                                                                containerMovimentacaoVarItem.dataVencimento!,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: containerMovimentacaoVarItem.id == _model.movimentacao?.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerMovimentacaoVarItem.apelido!,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: containerMovimentacaoVarItem.id == _model.movimentacao?.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(width: 12.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(width: 8.0)),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(86.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          containerMovimentacaoVarItem.descricao!,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: containerMovimentacaoVarItem.id == _model.movimentacao?.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(width: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            containerMovimentacaoVarItem.statusPagamento!
                                                                                ? 'Pago'
                                                                                : 'Em Aberto',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: containerMovimentacaoVarItem.tipo == 'Entrada' ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            formatNumber(
                                                                              containerMovimentacaoVarItem.valor,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                              currency: 'R\$ ',
                                                                            ),
                                                                            ' 0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: containerMovimentacaoVarItem.tipo == 'Entrada' ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      width: 400.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: _model
                                                            .editarCriarLabel,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      const TextSpan(
                                                        text: ' Lançamento',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                FutureBuilder<
                                                    List<LancamentoTipoRow>>(
                                                  future: LancamentoTipoTable()
                                                      .queryRows(
                                                    queryFn: (q) => q.order(
                                                        'apelido',
                                                        ascending: true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<LancamentoTipoRow>
                                                        wrapLancamentoTipoRowList =
                                                        snapshot.data!;

                                                    return Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          wrapLancamentoTipoRowList
                                                              .length,
                                                          (wrapIndex) {
                                                        final wrapLancamentoTipoRow =
                                                            wrapLancamentoTipoRowList[
                                                                wrapIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.lancamento =
                                                                wrapLancamentoTipoRow;
                                                            safeSetState(() {});
                                                          },
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: _model.lancamento
                                                                        ?.id ==
                                                                    wrapLancamentoTipoRow
                                                                        .id
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            elevation: 0.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      8.0,
                                                                      4.0),
                                                              child: Text(
                                                                wrapLancamentoTipoRow
                                                                    .apelido!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: _model.lancamento?.id ==
                                                                              wrapLancamentoTipoRow
                                                                                  .id
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryBackground
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    if (_model.lancamento !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 12.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  '${_model.lancamento?.apelido} - ${_model.lancamento?.descricao}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  '${_model.lancamento?.tipo} - ${_model.lancamento?.categoria}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0, 8.0, 0.0, 8.0),
                                                    child: FutureBuilder<
                                                        List<ClienteRow>>(
                                                      future: ClienteTable()
                                                          .queryRows(
                                                        queryFn: (q) => q.order(
                                                            'nome',
                                                            ascending: true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Center(
                                                            child: Text(
                                                                'Error: ${snapshot.error}'),
                                                          );
                                                        } else if (!snapshot
                                                                .hasData ||
                                                            snapshot.data!
                                                                .isEmpty) {
                                                          return Center(
                                                            child: Text(
                                                                'No data available'),
                                                          );
                                                        }

                                                        List<ClienteRow>
                                                            dropDownClienteClienteRowList =
                                                            snapshot.data!;

                                                        return FlutterFlowDropDown<
                                                            int>(
                                                          controller: _model
                                                                  .dropDownClienteValueController ??=
                                                              FormFieldController<
                                                                  int>(
                                                            _model.dropDownClienteValue ??=
                                                                dropDownClienteClienteRowList
                                                                        .isNotEmpty
                                                                    ? dropDownClienteClienteRowList
                                                                        .first
                                                                        .id
                                                                    : null,
                                                          ),
                                                          options: List<
                                                                  int>.from(
                                                              dropDownClienteClienteRowList
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()),
                                                          optionLabels:
                                                              dropDownClienteClienteRowList
                                                                  .map((e) =>
                                                                      e.nome)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropDownClienteValue =
                                                                    val);
                                                            _model.queryCliente =
                                                                await ClienteTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                      'id',
                                                                      _model
                                                                          .dropDownClienteValue),
                                                            );
                                                            _model.cliente =
                                                                _model
                                                                    .queryCliente
                                                                    ?.first;
                                                            safeSetState(() {});
                                                          },
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              'Selecione o cliente',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        );
                                                      },
                                                    )),
                                                if (_model.cliente != null)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.queryProjeto =
                                                          await ProjetoTable()
                                                              .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'id',
                                                          _model
                                                              .dropDownProjetoValue,
                                                        ),
                                                      );
                                                      _model.projeto = _model
                                                          .queryProjeto?.first;
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                8.0, 0.0, 8.0),
                                                        child: FutureBuilder<
                                                            List<ProjetoRow>>(
                                                          future: ProjetoTable()
                                                              .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'cliente_id',
                                                                  _model.cliente
                                                                      ?.id,
                                                                )
                                                                .order('nome',
                                                                    ascending:
                                                                        true),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ProjetoRow>
                                                                dropDownProjetoProjetoRowList =
                                                                snapshot.data!;

                                                            return FlutterFlowDropDown<
                                                                int>(
                                                              controller: _model
                                                                      .dropDownProjetoValueController ??=
                                                                  FormFieldController<
                                                                      int>(
                                                                _model.dropDownProjetoValue ??=
                                                                    0,
                                                              ),
                                                              options: List<
                                                                      int>.from(
                                                                  dropDownProjetoProjetoRowList
                                                                      .map((e) =>
                                                                          e.id)
                                                                      .toList()),
                                                              optionLabels:
                                                                  dropDownProjetoProjetoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .withoutNulls
                                                                      .toList(),
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownProjetoValue =
                                                                          val),
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'Selecione o projeto',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 0.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model
                                                        .lancamento?.apelido ==
                                                    'PAG-FOR')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0, 8.0, 0.0, 8.0),
                                                    child: FutureBuilder<
                                                        List<UsuarioRow>>(
                                                      future: UsuarioTable()
                                                          .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'nivel_id',
                                                          3,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsuarioRow>
                                                            dropDownUsuarioUsuarioRowList =
                                                            snapshot.data!;

                                                        return FlutterFlowDropDown<
                                                            int>(
                                                          controller: _model
                                                                  .dropDownUsuarioValueController ??=
                                                              FormFieldController<
                                                                  int>(
                                                            _model.dropDownUsuarioValue ??=
                                                                0,
                                                          ),
                                                          options: List<
                                                                  int>.from(
                                                              dropDownUsuarioUsuarioRowList
                                                                  .map((e) =>
                                                                      e.id)
                                                                  .toList()),
                                                          optionLabels:
                                                              dropDownUsuarioUsuarioRowList
                                                                  .map((e) =>
                                                                      e.nome)
                                                                  .withoutNulls
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropDownUsuarioValue =
                                                                    val);
                                                            _model.usuario =
                                                                null;
                                                            safeSetState(() {});
                                                            _model.queryUsuario =
                                                                await UsuarioTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'id',
                                                                _model
                                                                    .dropDownUsuarioValue,
                                                              ),
                                                            );
                                                            _model.usuario =
                                                                _model
                                                                    .queryUsuario
                                                                    ?.first;
                                                            safeSetState(() {});

                                                            safeSetState(() {});
                                                          },
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              'Selecione o colaborador',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldValorTextController,
                                                          focusNode: _model
                                                              .textFieldValorFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textFieldValorTextController',
                                                            const Duration(
                                                                milliseconds:
                                                                    10),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText: 'Valor',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText: 'Valor',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textFieldValorTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                      FlutterFlowDropDown<bool>(
                                                        controller: _model
                                                                .dropDownStatusPagamentoValueController ??=
                                                            FormFieldController<
                                                                bool>(
                                                          _model.dropDownStatusPagamentoValue ??=
                                                              false,
                                                        ),
                                                        options:
                                                            List<bool>.from(
                                                                [false, true]),
                                                        optionLabels: const [
                                                          'Em aberto',
                                                          'Pago'
                                                        ],
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.dropDownStatusPagamentoValue =
                                                                    val),
                                                        width: 150.0,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: 'Select...',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(12.0,
                                                                0.0, 12.0, 0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ].divide(const SizedBox(
                                                        width: 8.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textFieldDescricaoTextController,
                                                      focusNode: _model
                                                          .textFieldDescricaoFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'Descrição',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: 'Descrição',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: null,
                                                      minLines: 2,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .textFieldDescricaoTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .dataLancamentoTextController,
                                                    focusNode: _model
                                                        .dataLancamentoFocusNode,
                                                    autofocus: false,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText:
                                                          'Data do lançamento',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          'Data do lançamento',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .dataLancamentoTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: const Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  final datePicked1Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050),
                                                    builder: (context, child) {
                                                      return wrapInMaterialDatePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );

                                                  if (datePicked1Date != null) {
                                                    safeSetState(() {
                                                      _model.datePicked1 =
                                                          DateTime(
                                                        datePicked1Date.year,
                                                        datePicked1Date.month,
                                                        datePicked1Date.day,
                                                      );
                                                    });
                                                  }
                                                  safeSetState(() {
                                                    _model
                                                        .dataLancamentoTextController
                                                        ?.text = dateTimeFormat(
                                                      "d/M/y",
                                                      _model.datePicked1,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                    _model
                                                        .dataLancamentoFocusNode
                                                        ?.requestFocus();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      _model.dataLancamentoTextController
                                                              ?.selection =
                                                          TextSelection
                                                              .collapsed(
                                                        offset: _model
                                                            .dataLancamentoTextController!
                                                            .text
                                                            .length,
                                                      );
                                                    });
                                                  });
                                                  _model.dataLancamento =
                                                      _model.datePicked1;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ].divide(
                                                const SizedBox(width: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .dataVencimentoTextController,
                                                    focusNode: _model
                                                        .dataVencimentoFocusNode,
                                                    autofocus: false,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText:
                                                          'Data do vencimento',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          'Data do vencimento',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .dataVencimentoTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: const Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  final datePicked2Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050),
                                                    builder: (context, child) {
                                                      return wrapInMaterialDatePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );

                                                  if (datePicked2Date != null) {
                                                    safeSetState(() {
                                                      _model.datePicked2 =
                                                          DateTime(
                                                        datePicked2Date.year,
                                                        datePicked2Date.month,
                                                        datePicked2Date.day,
                                                      );
                                                    });
                                                  }
                                                  safeSetState(() {
                                                    _model
                                                        .dataVencimentoTextController
                                                        ?.text = dateTimeFormat(
                                                      "d/M/y",
                                                      _model.datePicked2,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                    _model
                                                        .dataVencimentoFocusNode
                                                        ?.requestFocus();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      _model.dataVencimentoTextController
                                                              ?.selection =
                                                          TextSelection
                                                              .collapsed(
                                                        offset: _model
                                                            .dataVencimentoTextController!
                                                            .text
                                                            .length,
                                                      );
                                                    });
                                                  });
                                                  _model.dataVencimento =
                                                      _model.datePicked2;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ].divide(
                                                const SizedBox(width: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.replay,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.movimentacao = null;
                                                  _model.lancamento = null;
                                                  _model.dataLancamento = null;
                                                  _model.dataVencimento = null;
                                                  _model.cliente = null;
                                                  _model.projeto = null;
                                                  _model.editarCriarLabel =
                                                      'Criar';
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .textFieldDescricaoTextController
                                                        ?.clear();
                                                    _model
                                                        .dataLancamentoTextController
                                                        ?.clear();
                                                    _model
                                                        .dataVencimentoTextController
                                                        ?.clear();
                                                    _model
                                                        .textFieldValorTextController
                                                        ?.clear();
                                                  });
                                                },
                                              ),
                                              if (_model.lancamento != null)
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .editaCriaLancamento(
                                                              context);
                                                      safeSetState(() {});
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    },
                                                    text: _model.movimentacao !=
                                                            null
                                                        ? 'Editar lançamento'
                                                        : 'Criar lançamento',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(16.0,
                                                              0.0, 16.0, 0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 0.0, 0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
