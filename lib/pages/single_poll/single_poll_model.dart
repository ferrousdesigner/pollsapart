import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/quest_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SinglePollModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for QuestCard component.
  late QuestCardModel questCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    questCardModel = createModel(context, () => QuestCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    questCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
