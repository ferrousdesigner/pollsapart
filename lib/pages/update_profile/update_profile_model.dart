import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/app_bar_widget.dart';
import '/components/text_field_double_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Model for TextFieldDouble component.
  late TextFieldDoubleModel textFieldDoubleModel;
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    textFieldModel = createModel(context, () => TextFieldModel());
    textFieldDoubleModel = createModel(context, () => TextFieldDoubleModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    textFieldModel.dispose();
    textFieldDoubleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
