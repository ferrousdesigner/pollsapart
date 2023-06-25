import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/newest_polls_widget.dart';
import '/components/trending_polls_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for TrendingPolls component.
  late TrendingPollsModel trendingPollsModel;
  // Model for NewestPolls component.
  late NewestPollsModel newestPollsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    trendingPollsModel = createModel(context, () => TrendingPollsModel());
    newestPollsModel = createModel(context, () => NewestPollsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    trendingPollsModel.dispose();
    newestPollsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
