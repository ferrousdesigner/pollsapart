import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/newest_polls_widget.dart';
import '/components/trending_polls_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Model for NewestPolls component.
  late NewestPollsModel newestPollsModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for TrendingPolls component.
  late TrendingPollsModel trendingPollsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    newestPollsModel = createModel(context, () => NewestPollsModel());
    trendingPollsModel = createModel(context, () => TrendingPollsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    newestPollsModel.dispose();
    trendingPollsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
