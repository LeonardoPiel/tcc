import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'componente_tarefa_acao_widget.dart' show ComponenteTarefaAcaoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteTarefaAcaoModel
    extends FlutterFlowModel<ComponenteTarefaAcaoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownStatusTarefa widget.
  String? dropDownStatusTarefaValue;
  FormFieldController<String>? dropDownStatusTarefaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
