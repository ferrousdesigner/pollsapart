import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/text_field_double_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AddPollModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? showAddCategoryForm = true;

  DocumentReference? selectedCategoryRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for TextFieldDouble component.
  late TextFieldDoubleModel textFieldDoubleModel;
  // Model for TextField component.
  late TextFieldModel textFieldModel1;
  // Model for TextField component.
  late TextFieldModel textFieldModel2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PollsRecord? pollCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoriesRecord? chosenCategory;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldDoubleModel = createModel(context, () => TextFieldDoubleModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldDoubleModel.dispose();
    textFieldModel1.dispose();
    textFieldModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
