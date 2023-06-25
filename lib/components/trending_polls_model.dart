import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quest_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class TrendingPollsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, PollsRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  // Models for QuestCard dynamic component.
  late FlutterFlowDynamicModels<QuestCardModel> questCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    questCardModels = FlutterFlowDynamicModels(() => QuestCardModel());
  }

  void dispose() {
    streamSubscriptions.forEach((s) => s?.cancel());
    questCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
