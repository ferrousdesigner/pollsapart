import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/text_field_double_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportAbuseModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for TextFieldDouble component.
  late TextFieldDoubleModel textFieldDoubleModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReportAbusesRecord? savedAbuse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    textFieldDoubleModel = createModel(context, () => TextFieldDoubleModel());

    textFieldDoubleModel.textControllerValidator = _formTextFieldValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    textFieldDoubleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 20) {
      return 'Requires at least 20 characters.';
    }
    if (val.length > 300) {
      return 'Maximum 300 characters allowed, currently ${val.length}.';
    }

    return null;
  }
}
