import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/app_bar_widget.dart';
import '/components/text_field_double_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPollModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? showAddCategoryForm = true;

  DocumentReference? selectedCategoryRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for TextFieldDouble component.
  late TextFieldDoubleModel textFieldDoubleModel;
  // Model for TextField component.
  late TextFieldModel textFieldModel1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Model for TextField component.
  late TextFieldModel textFieldModel2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

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
    appBarModel = createModel(context, () => AppBarModel());
    textFieldDoubleModel = createModel(context, () => TextFieldDoubleModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());

    textFieldDoubleModel.textControllerValidator = _formTextFieldValidator5;
    textFieldModel1.textControllerValidator = _formTextFieldValidator2;
    textFieldModel2.textControllerValidator = _formTextFieldValidator3;
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    textFieldDoubleModel.dispose();
    textFieldModel1.dispose();
    textFieldModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 30) {
      return 'Requires at least 30 characters.';
    }
    if (val.length > 200) {
      return 'Maximum 200 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }
}
