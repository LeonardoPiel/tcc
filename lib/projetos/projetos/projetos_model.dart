import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/menu/side_menu/side_menu_widget.dart';
import '/paginas/app_nav_bar/app_nav_bar_widget.dart';
import 'projetos_widget.dart' show ProjetosWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProjetosModel extends FlutterFlowModel<ProjetosWidget> {
  ///  Local state fields for this page.

  ProjetoRow? projeto;

  List<FaseProjetoRow> faseProjetoList = [];
  void addToFaseProjetoList(FaseProjetoRow item) => faseProjetoList.add(item);
  void removeFromFaseProjetoList(FaseProjetoRow item) =>
      faseProjetoList.remove(item);
  void removeAtIndexFromFaseProjetoList(int index) =>
      faseProjetoList.removeAt(index);
  void insertAtIndexInFaseProjetoList(int index, FaseProjetoRow item) =>
      faseProjetoList.insert(index, item);
  void updateFaseProjetoListAtIndex(
          int index, Function(FaseProjetoRow) updateFn) =>
      faseProjetoList[index] = updateFn(faseProjetoList[index]);

  FaseProjetoRow? faseProjeto;

  TarefaRow? tarefa;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
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
  // Stores action output result for [Backend Call - Query Rows] action in Container_projectInativos widget.
  List<FaseProjetoRow>? queryFaseProjetoInativo;
  // State field(s) for fase_nome widget.
  FocusNode? faseNomeFocusNode;
  TextEditingController? faseNomeTextController;
  String? Function(BuildContext, String?)? faseNomeTextControllerValidator;
  String? _faseNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome da fase';
    }

    return null;
  }

  // State field(s) for fase_dataInicio widget.
  FocusNode? faseDataInicioFocusNode;
  TextEditingController? faseDataInicioTextController;
  final faseDataInicioMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      faseDataInicioTextControllerValidator;
  String? _faseDataInicioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a data de início';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for fase_dataTermino widget.
  FocusNode? faseDataTerminoFocusNode;
  TextEditingController? faseDataTerminoTextController;
  final faseDataTerminoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      faseDataTerminoTextControllerValidator;
  String? _faseDataTerminoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a data de término';
    }

    return null;
  }

  DateTime? datePicked2;
  // Stores action output result for [Validate Form] action in ButtonEditarCriarProjetos widget.
  bool? validateForm;
  // State field(s) for tarefa_nome widget.
  FocusNode? tarefaNomeFocusNode;
  TextEditingController? tarefaNomeTextController;
  String? Function(BuildContext, String?)? tarefaNomeTextControllerValidator;
  String? _tarefaNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for tarefa_descricao widget.
  FocusNode? tarefaDescricaoFocusNode;
  TextEditingController? tarefaDescricaoTextController;
  String? Function(BuildContext, String?)?
      tarefaDescricaoTextControllerValidator;
  String? _tarefaDescricaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in ButtonEditarCriarTarefas widget.
  bool? validateFormTarefa;

  @override
  void initState(BuildContext context) {
    appNavBarModel = createModel(context, () => AppNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    faseNomeTextControllerValidator = _faseNomeTextControllerValidator;
    faseDataInicioTextControllerValidator =
        _faseDataInicioTextControllerValidator;
    faseDataTerminoTextControllerValidator =
        _faseDataTerminoTextControllerValidator;
    tarefaNomeTextControllerValidator = _tarefaNomeTextControllerValidator;
    tarefaDescricaoTextControllerValidator =
        _tarefaDescricaoTextControllerValidator;
  }

  @override
  void dispose() {
    appNavBarModel.dispose();
    sideMenuModel.dispose();
    tabBarController?.dispose();
    faseNomeFocusNode?.dispose();
    faseNomeTextController?.dispose();

    faseDataInicioFocusNode?.dispose();
    faseDataInicioTextController?.dispose();

    faseDataTerminoFocusNode?.dispose();
    faseDataTerminoTextController?.dispose();

    tarefaNomeFocusNode?.dispose();
    tarefaNomeTextController?.dispose();

    tarefaDescricaoFocusNode?.dispose();
    tarefaDescricaoTextController?.dispose();
  }
}
