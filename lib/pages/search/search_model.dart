import '/backend/backend.dart';
import '/components/quest_card_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SearchModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Algolia Search Results from action on IconButton
  List<PollsRecord>? algoliaSearchResults = [];
  // Models for QuestCard dynamic component.
  late FlutterFlowDynamicModels<QuestCardModel> questCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    questCardModels = FlutterFlowDynamicModels(() => QuestCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldModel.dispose();
    questCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
