import '/flutter_flow/flutter_flow_util.dart';
import 'componente_projeto_widget.dart' show ComponenteProjetoWidget;
import 'package:flutter/material.dart';

class ComponenteProjetoModel extends FlutterFlowModel<ComponenteProjetoWidget> {
  ///  Local state fields for this component.

  int? cliente;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_nome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeTextController;
  String? Function(BuildContext, String?)? textFieldNomeTextControllerValidator;
  // State field(s) for TextField_descricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNomeFocusNode?.dispose();
    textFieldNomeTextController?.dispose();

    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();
  }
}
