import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import '/projetos/componente_projeto/componente_projeto_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'projetos_model.dart';
export 'projetos_model.dart';

class ProjetosWidget extends StatefulWidget {
  const ProjetosWidget({super.key});

  @override
  State<ProjetosWidget> createState() => _ProjetosWidgetState();
}

class _ProjetosWidgetState extends State<ProjetosWidget>
    with TickerProviderStateMixin {
  late ProjetosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjetosModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.faseNomeTextController ??= TextEditingController();
    _model.faseNomeFocusNode ??= FocusNode();

    _model.faseDataInicioTextController ??= TextEditingController();
    _model.faseDataInicioFocusNode ??= FocusNode();
    _model.faseDataInicioFocusNode!.addListener(() => safeSetState(() {}));
    _model.faseDataTerminoTextController ??= TextEditingController();
    _model.faseDataTerminoFocusNode ??= FocusNode();

    _model.tarefaNomeTextController ??= TextEditingController();
    _model.tarefaNomeFocusNode ??= FocusNode();

    _model.tarefaDescricaoTextController ??= TextEditingController();
    _model.tarefaDescricaoFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(30.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(30.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
                      selectedNav: 'projeto',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 1000.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: FutureBuilder<List<ProjetoRow>>(
                                  future: ProjetoTable().queryRows(
                                    queryFn: (q) => q,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProjetoRow>
                                        containerProjetosProjetoRowList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      height: 160.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: const Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    unselectedLabelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    tabs: const [
                                                      Tab(
                                                        text: 'Projetos Ativos',
                                                      ),
                                                      Tab(
                                                        text:
                                                            'Projetos Inativos',
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final containerProjetosVarAtivo = containerProjetosProjetoRowList
                                                                      .where((e) =>
                                                                          e.ativo)
                                                                      .toList();

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        containerProjetosVarAtivo
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            containerProjetosVarAtivoIndex) {
                                                                      final containerProjetosVarAtivoItem =
                                                                          containerProjetosVarAtivo[
                                                                              containerProjetosVarAtivoIndex];
                                                                      return Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.queryFaseProjetoAtivo =
                                                                                await FaseProjetoTable().queryRows(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'projeto_id',
                                                                                containerProjetosVarAtivoItem.id,
                                                                              ),
                                                                            );
                                                                            if (_model.projeto?.id ==
                                                                                containerProjetosVarAtivoItem.id) {
                                                                              _model.projeto = null;
                                                                              _model.faseProjetoList = [];
                                                                              _model.tarefa = null;
                                                                              _model.faseProjeto = null;
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.tarefaDescricaoTextController?.clear();
                                                                                _model.tarefaNomeTextController?.clear();
                                                                                _model.faseDataTerminoTextController?.clear();
                                                                                _model.faseDataInicioTextController?.clear();
                                                                                _model.faseNomeTextController?.clear();
                                                                              });
                                                                              safeSetState(() {
                                                                                _model.dropDownValueController?.reset();
                                                                              });
                                                                            } else {
                                                                              _model.projeto = containerProjetosVarAtivoItem;
                                                                              _model.faseProjetoList = _model.queryFaseProjetoAtivo!.toList().cast<FaseProjetoRow>();
                                                                              _model.faseProjeto = null;
                                                                              _model.tarefa = null;
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.tarefaDescricaoTextController?.clear();
                                                                                _model.tarefaNomeTextController?.clear();
                                                                                _model.faseDataTerminoTextController?.clear();
                                                                                _model.faseDataInicioTextController?.clear();
                                                                                _model.faseNomeTextController?.clear();
                                                                              });
                                                                              safeSetState(() {
                                                                                _model.dropDownValueController?.reset();
                                                                              });
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                200.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: const [
                                                                                BoxShadow(
                                                                                  blurRadius: 4.0,
                                                                                  color: Color(0x34090F13),
                                                                                  offset: Offset(
                                                                                    0.0,
                                                                                    2.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              border: Border.all(
                                                                                color: containerProjetosVarAtivoItem.id == _model.projeto?.id ? FlutterFlowTheme.of(context).primary : const Color(0x00000000),
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: AutoSizeText(
                                                                                      containerProjetosVarAtivoItem.nome!.maybeHandleOverflow(
                                                                                        maxChars: 30,
                                                                                      ),
                                                                                      maxLines: 3,
                                                                                      minFontSize: 14.0,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Inter Tight',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return GestureDetector(
                                                                                              onTap: () => FocusScope.of(context).unfocus(),
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: ComponenteProjetoWidget(
                                                                                                  projeto: containerProjetosVarAtivoItem,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerProjetosVarInativo =
                                                                    containerProjetosProjetoRowList
                                                                        .where((e) =>
                                                                            !e.ativo)
                                                                        .toList();

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount:
                                                                      containerProjetosVarInativo
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          containerProjetosVarInativoIndex) {
                                                                    final containerProjetosVarInativoItem =
                                                                        containerProjetosVarInativo[
                                                                            containerProjetosVarInativoIndex];
                                                                    return Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.queryFaseProjetoInativo =
                                                                              await FaseProjetoTable().queryRows(
                                                                            queryFn: (q) =>
                                                                                q.eqOrNull(
                                                                              'projeto_id',
                                                                              containerProjetosVarInativoItem.id,
                                                                            ),
                                                                          );
                                                                          if (_model.projeto?.id ==
                                                                              containerProjetosVarInativoItem.id) {
                                                                            _model.projeto =
                                                                                null;
                                                                            _model.faseProjetoList =
                                                                                [];
                                                                            _model.tarefa =
                                                                                null;
                                                                            _model.faseProjeto =
                                                                                null;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {
                                                                              _model.tarefaDescricaoTextController?.clear();
                                                                              _model.tarefaNomeTextController?.clear();
                                                                              _model.faseDataTerminoTextController?.clear();
                                                                              _model.faseDataInicioTextController?.clear();
                                                                              _model.faseNomeTextController?.clear();
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.dropDownValueController?.reset();
                                                                            });
                                                                          } else {
                                                                            _model.projeto =
                                                                                containerProjetosVarInativoItem;
                                                                            _model.faseProjetoList =
                                                                                _model.queryFaseProjetoInativo!.toList().cast<FaseProjetoRow>();
                                                                            _model.faseProjeto =
                                                                                null;
                                                                            _model.tarefa =
                                                                                null;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {
                                                                              _model.tarefaDescricaoTextController?.clear();
                                                                              _model.tarefaNomeTextController?.clear();
                                                                              _model.faseDataTerminoTextController?.clear();
                                                                              _model.faseDataInicioTextController?.clear();
                                                                              _model.faseNomeTextController?.clear();
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.dropDownValueController?.reset();
                                                                            });
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              200.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x34090F13),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: containerProjetosVarInativoItem.id == _model.projeto?.id ? FlutterFlowTheme.of(context).primary : const Color(0x00000000),
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: AutoSizeText(
                                                                                    containerProjetosVarInativoItem.nome!,
                                                                                    maxLines: 3,
                                                                                    minFontSize: 14.0,
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: 'Inter Tight',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return GestureDetector(
                                                                                            onTap: () => FocusScope.of(context).unfocus(),
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: ComponenteProjetoWidget(
                                                                                                projeto: containerProjetosVarInativoItem,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.edit,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation2']!),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          const ComponenteProjetoWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: 'Novo Projeto',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 20.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (_model.projeto != null)
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Text(
                                                  'Fases',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Text(
                                                          'Nome',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
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
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 80.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Text(
                                                            'Início',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
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
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 80.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Text(
                                                            'Fim',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
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
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ],
                                              ),
                                              FutureBuilder<
                                                  List<FaseProjetoRow>>(
                                                future: FaseProjetoTable()
                                                    .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'projeto_id',
                                                        _model.projeto?.id,
                                                      )
                                                      .order('created_at',
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
                                                  List<FaseProjetoRow>
                                                      listViewFasesFaseProjetoRowList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewFasesFaseProjetoRowList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        listViewFasesIndex) {
                                                      final listViewFasesFaseProjetoRow =
                                                          listViewFasesFaseProjetoRowList[
                                                              listViewFasesIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model.faseProjeto
                                                                  ?.id ==
                                                              listViewFasesFaseProjetoRow
                                                                  .id) {
                                                            _model.faseProjeto =
                                                                null;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .faseNomeTextController
                                                                  ?.clear();
                                                              _model
                                                                  .faseDataInicioTextController
                                                                  ?.clear();
                                                              _model
                                                                  .faseDataTerminoTextController
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            _model.faseProjeto =
                                                                listViewFasesFaseProjetoRow;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model.faseNomeTextController
                                                                      ?.text =
                                                                  listViewFasesFaseProjetoRow
                                                                      .nome!;
                                                              _model
                                                                  .faseNomeFocusNode
                                                                  ?.requestFocus();
                                                              WidgetsBinding
                                                                  .instance
                                                                  .addPostFrameCallback(
                                                                      (_) {
                                                                _model.faseNomeTextController
                                                                        ?.selection =
                                                                    TextSelection
                                                                        .collapsed(
                                                                  offset: _model
                                                                      .faseNomeTextController!
                                                                      .text
                                                                      .length,
                                                                );
                                                              });
                                                            });
                                                            safeSetState(() {
                                                              _model.faseDataInicioTextController
                                                                      ?.text =
                                                                  dateTimeFormat(
                                                                "yMd",
                                                                listViewFasesFaseProjetoRow
                                                                    .dataInicio!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              );
                                                              _model
                                                                  .faseDataInicioFocusNode
                                                                  ?.requestFocus();
                                                              WidgetsBinding
                                                                  .instance
                                                                  .addPostFrameCallback(
                                                                      (_) {
                                                                _model.faseDataInicioTextController
                                                                        ?.selection =
                                                                    TextSelection
                                                                        .collapsed(
                                                                  offset: _model
                                                                      .faseDataInicioTextController!
                                                                      .text
                                                                      .length,
                                                                );
                                                              });
                                                              _model
                                                                  .faseDataInicioMask
                                                                  .updateMask(
                                                                newValue:
                                                                    TextEditingValue(
                                                                  text: _model
                                                                      .faseDataInicioTextController!
                                                                      .text,
                                                                  selection:
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .faseDataInicioTextController!
                                                                        .text
                                                                        .length,
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                            safeSetState(() {
                                                              _model.faseDataTerminoTextController
                                                                      ?.text =
                                                                  dateTimeFormat(
                                                                "d/M/y",
                                                                listViewFasesFaseProjetoRow
                                                                    .dataFim!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              );
                                                              _model
                                                                  .faseDataTerminoFocusNode
                                                                  ?.requestFocus();
                                                              WidgetsBinding
                                                                  .instance
                                                                  .addPostFrameCallback(
                                                                      (_) {
                                                                _model.faseDataTerminoTextController
                                                                        ?.selection =
                                                                    TextSelection
                                                                        .collapsed(
                                                                  offset: _model
                                                                      .faseDataTerminoTextController!
                                                                      .text
                                                                      .length,
                                                                );
                                                              });
                                                              _model
                                                                  .faseDataTerminoMask
                                                                  .updateMask(
                                                                newValue:
                                                                    TextEditingValue(
                                                                  text: _model
                                                                      .faseDataTerminoTextController!
                                                                      .text,
                                                                  selection:
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .faseDataTerminoTextController!
                                                                        .text
                                                                        .length,
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                          }

                                                          safeSetState(() {
                                                            _model
                                                                .dropDownValueController
                                                                ?.reset();
                                                          });
                                                          safeSetState(() {
                                                            _model
                                                                .tarefaDescricaoTextController
                                                                ?.clear();
                                                            _model
                                                                .tarefaNomeTextController
                                                                ?.clear();
                                                          });
                                                        },
                                                        child: Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                            minHeight: 36.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model.faseProjeto
                                                                        ?.id ==
                                                                    listViewFasesFaseProjetoRow
                                                                        .id
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  listViewFasesFaseProjetoRow
                                                                      .nome!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: _model.faseProjeto?.id ==
                                                                                listViewFasesFaseProjetoRow.id
                                                                            ? FlutterFlowTheme.of(context).secondaryBackground
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        "d/M/y",
                                                                        listViewFasesFaseProjetoRow
                                                                            .dataInicio!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color: _model.faseProjeto?.id == listViewFasesFaseProjetoRow.id
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        "d/M/y",
                                                                        listViewFasesFaseProjetoRow
                                                                            .dataFim!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color: _model.faseProjeto?.id == listViewFasesFaseProjetoRow.id
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ].divide(const SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Text(
                                                    _model.faseProjeto != null
                                                        ? 'Editar fase'
                                                        : 'Criar nova fase',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Form(
                                                    key: _model.formKey2,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .faseNomeTextController,
                                                            focusNode: _model
                                                                .faseNomeFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Nome da fase',
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
                                                                  'Nome da fase',
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
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .faseNomeTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: 200.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .faseDataInicioTextController,
                                                                  focusNode: _model
                                                                      .faseDataInicioFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Data de início',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Data de início',
                                                                    hintStyle: FlutterFlowTheme.of(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .datetime,
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .faseDataInicioTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    _model
                                                                        .faseDataInicioMask
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .date_range,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final datePicked1Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      getCurrentTimestamp,
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
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
                                                                                FontWeight.w600,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (datePicked1Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked1 =
                                                                        DateTime(
                                                                      datePicked1Date
                                                                          .year,
                                                                      datePicked1Date
                                                                          .month,
                                                                      datePicked1Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                }
                                                                safeSetState(
                                                                    () {
                                                                  _model.faseDataInicioTextController
                                                                          ?.text =
                                                                      dateTimeFormat(
                                                                    "d/M/y",
                                                                    _model
                                                                        .datePicked1,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  );
                                                                  _model
                                                                      .faseDataInicioFocusNode
                                                                      ?.requestFocus();
                                                                  WidgetsBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (_) {
                                                                    _model.faseDataInicioTextController
                                                                            ?.selection =
                                                                        TextSelection
                                                                            .collapsed(
                                                                      offset: _model
                                                                          .faseDataInicioTextController!
                                                                          .text
                                                                          .length,
                                                                    );
                                                                  });
                                                                  _model
                                                                      .faseDataInicioMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .faseDataInicioTextController!
                                                                          .text,
                                                                      selection:
                                                                          TextSelection
                                                                              .collapsed(
                                                                        offset: _model
                                                                            .faseDataInicioTextController!
                                                                            .text
                                                                            .length,
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                width: 200.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .faseDataTerminoTextController,
                                                                  focusNode: _model
                                                                      .faseDataTerminoFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Data de término',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Data de término',
                                                                    hintStyle: FlutterFlowTheme.of(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .datetime,
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .faseDataTerminoTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    _model
                                                                        .faseDataTerminoMask
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .date_range,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final datePicked2Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      getCurrentTimestamp,
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
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
                                                                                FontWeight.w600,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (datePicked2Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked2 =
                                                                        DateTime(
                                                                      datePicked2Date
                                                                          .year,
                                                                      datePicked2Date
                                                                          .month,
                                                                      datePicked2Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                }
                                                                safeSetState(
                                                                    () {
                                                                  _model.faseDataTerminoTextController
                                                                          ?.text =
                                                                      dateTimeFormat(
                                                                    "d/M/y",
                                                                    _model
                                                                        .datePicked2,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  );
                                                                  _model
                                                                      .faseDataTerminoFocusNode
                                                                      ?.requestFocus();
                                                                  WidgetsBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (_) {
                                                                    _model.faseDataTerminoTextController
                                                                            ?.selection =
                                                                        TextSelection
                                                                            .collapsed(
                                                                      offset: _model
                                                                          .faseDataTerminoTextController!
                                                                          .text
                                                                          .length,
                                                                    );
                                                                  });
                                                                  _model
                                                                      .faseDataTerminoMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .faseDataTerminoTextController!
                                                                          .text,
                                                                      selection:
                                                                          TextSelection
                                                                              .collapsed(
                                                                        offset: _model
                                                                            .faseDataTerminoTextController!
                                                                            .text
                                                                            .length,
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                              },
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    36.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 8.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                          icon: Icon(
                                                            Icons
                                                                .delete_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Deletar Fase'),
                                                                          content:
                                                                              Text('Deseja realmente deletar a fase ${_model.faseProjeto?.nome}?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('Cancelar'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('Confirmar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              await FaseProjetoTable()
                                                                  .delete(
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                  'id',
                                                                  _model
                                                                      .faseProjeto
                                                                      ?.id,
                                                                ),
                                                              );
                                                              _model.faseProjeto =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .faseDataTerminoTextController
                                                                    ?.clear();
                                                                _model
                                                                    .faseDataInicioTextController
                                                                    ?.clear();
                                                                _model
                                                                    .faseNomeTextController
                                                                    ?.clear();
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Fase excluída com sucesso.',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      if (_model.faseProjeto !=
                                                          null)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      36.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons.replay,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              _model.faseProjeto =
                                                                  null;
                                                              _model.tarefa =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .faseNomeTextController
                                                                    ?.clear();
                                                                _model
                                                                    .faseDataInicioTextController
                                                                    ?.clear();
                                                                _model
                                                                    .faseDataTerminoTextController
                                                                    ?.clear();
                                                                _model
                                                                    .tarefaDescricaoTextController
                                                                    ?.clear();
                                                                _model
                                                                    .tarefaNomeTextController
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model
                                                                    .dropDownValueController
                                                                    ?.reset();
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.validateForm =
                                                            true;
                                                        if (_model.formKey2
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey2
                                                                .currentState!
                                                                .validate()) {
                                                          _model.validateForm =
                                                              false;
                                                        }
                                                        if (_model
                                                            .validateForm!) {
                                                          if (_model
                                                                  .faseProjeto !=
                                                              null) {
                                                            await FaseProjetoTable()
                                                                .update(
                                                              data: {
                                                                'nome': _model
                                                                    .faseNomeTextController
                                                                    .text,
                                                                'data_inicio': supaSerialize<
                                                                        DateTime>(
                                                                    functions.stringToDate(_model
                                                                        .faseDataInicioTextController
                                                                        .text)),
                                                                'data_fim': supaSerialize<
                                                                        DateTime>(
                                                                    functions.stringToDate(_model
                                                                        .faseDataTerminoTextController
                                                                        .text)),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                _model
                                                                    .faseProjeto
                                                                    ?.id,
                                                              ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Fase atualizada com sucesso!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else {
                                                            await FaseProjetoTable()
                                                                .insert({
                                                              'nome': _model
                                                                  .faseNomeTextController
                                                                  .text,
                                                              'projeto_id':
                                                                  _model.projeto
                                                                      ?.id,
                                                              'data_inicio': supaSerialize<
                                                                      DateTime>(
                                                                  functions.stringToDate(_model
                                                                      .faseDataInicioTextController
                                                                      .text)),
                                                              'data_fim': supaSerialize<
                                                                      DateTime>(
                                                                  functions.stringToDate(_model
                                                                      .faseDataTerminoTextController
                                                                      .text)),
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Fase adicionada com sucesso!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }

                                                          _model.faseProjeto =
                                                              null;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .faseNomeTextController
                                                                ?.clear();
                                                            _model
                                                                .faseDataInicioTextController
                                                                ?.clear();
                                                            _model
                                                                .faseDataTerminoTextController
                                                                ?.clear();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Informe Nome da fase e datas de início e término.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                            ),
                                                          );
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text:
                                                          _model.faseProjeto !=
                                                                  null
                                                              ? 'Editar'
                                                              : 'Criar',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
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
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.faseProjeto != null)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        color: Color(0x1B090F13),
                                        offset: Offset(
                                          0.0,
                                          -2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Text(
                                                    'Tarefas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Text(
                                                            'Nome',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
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
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Text(
                                                            'Descrição',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
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
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 90.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Text(
                                                          'Status',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                FutureBuilder<List<TarefaRow>>(
                                                  future:
                                                      TarefaTable().queryRows(
                                                    queryFn: (q) => q
                                                        .eqOrNull(
                                                          'fase_projeto_id',
                                                          _model
                                                              .faseProjeto?.id,
                                                        )
                                                        .order('created_at',
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
                                                    List<TarefaRow>
                                                        listViewTarefasTarefaRowList =
                                                        snapshot.data!;

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewTarefasTarefaRowList
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          listViewTarefasIndex) {
                                                        final listViewTarefasTarefaRow =
                                                            listViewTarefasTarefaRowList[
                                                                listViewTarefasIndex];
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
                                                            if (_model.tarefa
                                                                    ?.id ==
                                                                listViewTarefasTarefaRow
                                                                    .id) {
                                                              _model.tarefa =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .tarefaNomeTextController
                                                                    ?.clear();
                                                                _model
                                                                    .tarefaDescricaoTextController
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model
                                                                    .dropDownValueController
                                                                    ?.reset();
                                                              });
                                                            } else {
                                                              _model.tarefa =
                                                                  listViewTarefasTarefaRow;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.tarefaNomeTextController
                                                                        ?.text =
                                                                    listViewTarefasTarefaRow
                                                                        .nome!;
                                                                _model
                                                                    .tarefaNomeFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.tarefaNomeTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .tarefaNomeTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                              });
                                                              safeSetState(() {
                                                                _model.tarefaDescricaoTextController
                                                                        ?.text =
                                                                    listViewTarefasTarefaRow
                                                                        .descricao!;
                                                                _model
                                                                    .tarefaDescricaoFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.tarefaDescricaoTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .tarefaDescricaoTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                              });
                                                              safeSetState(() {
                                                                _model.dropDownValueController
                                                                        ?.value =
                                                                    listViewTarefasTarefaRow
                                                                        .status!;
                                                              });
                                                            }
                                                          },
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              minHeight: 36.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .tarefa
                                                                          ?.id ==
                                                                      listViewTarefasTarefaRow
                                                                          .id
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        listViewTarefasTarefaRow
                                                                            .nome!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: _model.tarefa?.id == listViewTarefasTarefaRow.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        listViewTarefasTarefaRow
                                                                            .descricao!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: _model.tarefa?.id == listViewTarefasTarefaRow.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 90.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: Text(
                                                                      listViewTarefasTarefaRow
                                                                          .status!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color: _model.tarefa?.id == listViewTarefasTarefaRow.id
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
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
                                              ].divide(const SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Text(
                                                    _model.tarefa != null
                                                        ? 'Editar tarefa'
                                                        : 'Criar nova tarefa',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 28.0, 0.0, 0.0),
                                                  child: Form(
                                                    key: _model.formKey1,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .tarefaNomeTextController,
                                                            focusNode: _model
                                                                .tarefaNomeFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Nome da tarefa',
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
                                                                  'Nome da tarefa',
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
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .tarefaNomeTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .tarefaDescricaoTextController,
                                                            focusNode: _model
                                                                .tarefaDescricaoFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Descrição',
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
                                                                  'Descrição',
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
                                                            maxLines: null,
                                                            minLines: 3,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .tarefaDescricaoTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        FlutterFlowDropDown<
                                                            String>(
                                                          controller: _model
                                                                  .dropDownValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownValue ??=
                                                                'Não Iniciado',
                                                          ),
                                                          options: const [
                                                            'Não Iniciado',
                                                            'Em andamento',
                                                            'Finalizado'
                                                          ],
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.dropDownValue =
                                                                      val),
                                                          width:
                                                              double.infinity,
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
                                                              'Status da tarefa',
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
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      36.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('Deletar Atividade'),
                                                                            content:
                                                                                Text('Deseja realmente deletar a atividade ${_model.tarefa?.nome}?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: const Text('Cancelar'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: const Text('Confirmar'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                await TarefaTable()
                                                                    .delete(
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'id',
                                                                    _model
                                                                        .tarefa
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                _model.tarefa =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .tarefaNomeTextController
                                                                      ?.clear();
                                                                  _model
                                                                      .tarefaDescricaoTextController
                                                                      ?.clear();
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownValueController
                                                                      ?.reset();
                                                                });
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Tarefa excluída com sucesso.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        if (_model.tarefa !=
                                                            null)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        36.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons.replay,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.tarefa =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .tarefaNomeTextController
                                                                      ?.clear();
                                                                  _model
                                                                      .tarefaDescricaoTextController
                                                                      ?.clear();
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownValueController
                                                                      ?.reset();
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.validateFormTarefa =
                                                              true;
                                                          if (_model.formKey1
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey1
                                                                  .currentState!
                                                                  .validate()) {
                                                            _model.validateFormTarefa =
                                                                false;
                                                          }
                                                          if (_model
                                                                  .dropDownValue ==
                                                              null) {
                                                            _model.validateFormTarefa =
                                                                false;
                                                          }
                                                          if (_model
                                                              .validateFormTarefa!) {
                                                            if (_model.tarefa !=
                                                                null) {
                                                              await TarefaTable()
                                                                  .update(
                                                                data: {
                                                                  'nome': _model
                                                                      .tarefaNomeTextController
                                                                      .text,
                                                                  'descricao':
                                                                      _model
                                                                          .tarefaDescricaoTextController
                                                                          .text,
                                                                  'status': _model
                                                                      .dropDownValue,
                                                                },
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                  'id',
                                                                  _model.tarefa
                                                                      ?.id,
                                                                ),
                                                              );
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Tarefa atualizada com sucesso!',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else {
                                                              await TarefaTable()
                                                                  .insert({
                                                                'nome': _model
                                                                    .tarefaNomeTextController
                                                                    .text,
                                                                'descricao': _model
                                                                    .tarefaDescricaoTextController
                                                                    .text,
                                                                'fase_projeto_id':
                                                                    _model
                                                                        .faseProjeto
                                                                        ?.id,
                                                                'status': _model
                                                                    .dropDownValue,
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Tarefa adicionada com sucesso!',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            }

                                                            _model.tarefa =
                                                                null;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .tarefaNomeTextController
                                                                  ?.clear();
                                                              _model
                                                                  .tarefaDescricaoTextController
                                                                  ?.clear();
                                                            });
                                                            safeSetState(() {
                                                              _model
                                                                  .dropDownValueController
                                                                  ?.reset();
                                                            });
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Informe Nome e descrição para a tarefa',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: _model.tarefa !=
                                                                null
                                                            ? 'Editar'
                                                            : 'Criar',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              BorderRadius
                                                                  .circular(
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
                                      ),
                                    ],
                                  ),
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
