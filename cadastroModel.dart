import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastro_usuario_widget.dart' show CadastroUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroUsuarioModel extends FlutterFlowModel<CadastroUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TxNome widget.
  FocusNode? txNomeFocusNode;
  TextEditingController? txNomeController;
  String? Function(BuildContext, String?)? txNomeControllerValidator;
  // State field(s) for TxtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;
  // State field(s) for TxtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaControllerValidator;
  // State field(s) for TxtConfSenha widget.
  FocusNode? txtConfSenhaFocusNode;
  TextEditingController? txtConfSenhaController;
  late bool txtConfSenhaVisibility;
  String? Function(BuildContext, String?)? txtConfSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtSenhaVisibility = false;
    txtConfSenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txNomeFocusNode?.dispose();
    txNomeController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaController?.dispose();

    txtConfSenhaFocusNode?.dispose();
    txtConfSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
