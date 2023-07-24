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
import 'single_poll_model.dart';
export 'single_poll_model.dart';

class SinglePollWidget extends StatefulWidget {
  const SinglePollWidget({
    Key? key,
    required this.pollRef,
  }) : super(key: key);

  final DocumentReference? pollRef;

  @override
  _SinglePollWidgetState createState() => _SinglePollWidgetState();
}

class _SinglePollWidgetState extends State<SinglePollWidget> {
  late SinglePollModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinglePollModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SinglePoll'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appBarModel,
                updateCallback: () => setState(() {}),
                child: AppBarWidget(
                  showLeftIcon: false,
                  showRightIcon: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<PollsRecord>(
                      stream: PollsRecord.getDocument(widget.pollRef!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final questCardPollsRecord = snapshot.data!;
                        return wrapWithModel(
                          model: _model.questCardModel,
                          updateCallback: () => setState(() {}),
                          child: QuestCardWidget(
                            question: questCardPollsRecord.question,
                            optionOne: questCardPollsRecord.optionOne,
                            optionTwo: questCardPollsRecord.optionTwo,
                            upVotes: questCardPollsRecord.upVotes,
                            isNSFW: questCardPollsRecord.isNsfw,
                            canDelete: false,
                            docRef: widget.pollRef!,
                            isDeleted: false,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('SINGLE_POLL_PAGE_BACK_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('Feed');
                  },
                  text: 'Back',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
