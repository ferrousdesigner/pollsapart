import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/count_label_widget.dart';
import '/components/profile_poll_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PublicProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for CountLabel component.
  late CountLabelModel countLabelModel1;
  // Model for CountLabel component.
  late CountLabelModel countLabelModel2;
  // Model for ProfilePollList component.
  late ProfilePollListModel profilePollListModel1;
  // Model for ProfilePollList component.
  late ProfilePollListModel profilePollListModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    countLabelModel1 = createModel(context, () => CountLabelModel());
    countLabelModel2 = createModel(context, () => CountLabelModel());
    profilePollListModel1 = createModel(context, () => ProfilePollListModel());
    profilePollListModel2 = createModel(context, () => ProfilePollListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    countLabelModel1.dispose();
    countLabelModel2.dispose();
    profilePollListModel1.dispose();
    profilePollListModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
