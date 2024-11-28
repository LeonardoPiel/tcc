import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_reset_widget.dart' show AuthResetWidget;
import 'package:flutter/material.dart';

class AuthResetModel extends FlutterFlowModel<AuthResetWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update User)] action in Button widget.
  ApiCallResponse? apiResult0cw;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
