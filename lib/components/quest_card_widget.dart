import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'quest_card_model.dart';
export 'quest_card_model.dart';

class QuestCardWidget extends StatefulWidget {
  const QuestCardWidget({
    Key? key,
    String? question,
    String? optionOne,
    String? optionTwo,
    required this.docRef,
    this.upVotes,
    bool? isNSFW,
    this.canDelete,
    this.createdAt,
    this.createdBy,
    this.isDeleted,
    this.isAnonymous,
    this.category,
  })  : this.question = question ?? 'Question Text',
        this.optionOne = optionOne ?? 'Option One',
        this.optionTwo = optionTwo ?? 'Option Two',
        this.isNSFW = isNSFW ?? false,
        super(key: key);

  final String question;
  final String optionOne;
  final String optionTwo;
  final DocumentReference? docRef;
  final int? upVotes;
  final bool isNSFW;
  final bool? canDelete;
  final String? createdAt;
  final DocumentReference? createdBy;
  final bool? isDeleted;
  final bool? isAnonymous;
  final String? category;

  @override
  _QuestCardWidgetState createState() => _QuestCardWidgetState();
}

class _QuestCardWidgetState extends State<QuestCardWidget> {
  late QuestCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !widget.isDeleted!,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 345.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF12711),
                  FlutterFlowTheme.of(context).primary
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(1.0, -1.0),
                end: AlignmentDirectional(-1.0, 1.0),
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 10.0),
                      child: Text(
                        widget.category!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Color(0xAFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 349.0,
                          height: 148.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              widget.question.maybeHandleOverflow(
                                maxChars: 100,
                                replacement: '…',
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.3,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'QUEST_CARD_Container_99t1mwrm_ON_TAP');
                            if ((currentUserDocument?.pollsAnswered?.toList() ??
                                    [])
                                .contains(widget.docRef)) {
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'PollMetric',
                                queryParameters: {
                                  'pollRef': serializeParam(
                                    widget.docRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'PollMetric',
                                queryParameters: {
                                  'pollRef': serializeParam(
                                    widget.docRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              logFirebaseEvent('Container_backend_call');

                              await widget.docRef!.update({
                                'option_one_count': FieldValue.increment(1),
                              });
                              logFirebaseEvent('Container_backend_call');

                              await currentUserReference!.update({
                                'polls_answered':
                                    FieldValue.arrayUnion([widget.docRef]),
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.419,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Color(0x45F1F4F8),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      widget.optionOne,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'QUEST_CARD_Container_kbkdditx_ON_TAP');
                            if ((currentUserDocument?.pollsAnswered?.toList() ??
                                    [])
                                .contains(widget.docRef)) {
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'PollMetric',
                                queryParameters: {
                                  'pollRef': serializeParam(
                                    widget.docRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'PollMetric',
                                queryParameters: {
                                  'pollRef': serializeParam(
                                    widget.docRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              logFirebaseEvent('Container_backend_call');

                              await widget.docRef!.update({
                                'option_two_count': FieldValue.increment(1),
                              });
                              logFirebaseEvent('Container_backend_call');

                              await currentUserReference!.update({
                                'polls_answered':
                                    FieldValue.arrayUnion([widget.docRef]),
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Color(0x45F1F4F8),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        widget.optionTwo,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.canDelete == true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.delete,
                                color: FlutterFlowTheme.of(context).error,
                                size: 14.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'QUEST_CARD_COMP_delete_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_backend_call');

                                await widget.docRef!
                                    .update(createPollsRecordData(
                                  isDeleted: true,
                                ));
                                logFirebaseEvent('IconButton_backend_call');

                                await currentUserReference!.update({
                                  'polls_created':
                                      FieldValue.arrayRemove([widget.docRef]),
                                });
                                logFirebaseEvent('IconButton_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Poll deleted successfully',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                            ),
                          ),
                        Container(
                          width: 120.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0x45F1F4F8),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.thumb_up_off_alt,
                                      color: (currentUserDocument?.pollsUpvoted
                                                      ?.toList() ??
                                                  [])
                                              .contains(widget.docRef)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 14.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'QUEST_CARD_thumb_up_off_alt_ICN_ON_TAP');
                                      if (!(currentUserDocument?.pollsUpvoted
                                                  ?.toList() ??
                                              [])
                                          .contains(widget.docRef)) {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await widget.docRef!.update({
                                          'up_votes': FieldValue.increment(1),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await currentUserReference!.update({
                                          'polls_upvoted':
                                              FieldValue.arrayUnion(
                                                  [widget.docRef]),
                                        });
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await widget.docRef!.update({
                                          'up_votes':
                                              FieldValue.increment(-(1)),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await currentUserReference!.update({
                                          'polls_upvoted':
                                              FieldValue.arrayRemove(
                                                  [widget.docRef]),
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      widget.upVotes,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 10.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.thumb_down_outlined,
                                      color: (currentUserDocument
                                                      ?.pollsDownvoted
                                                      ?.toList() ??
                                                  [])
                                              .contains(widget.docRef)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      size: 13.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'QUEST_CARD_thumb_down_outlined_ICN_ON_TA');
                                      if ((currentUserDocument?.pollsDownvoted
                                                  ?.toList() ??
                                              [])
                                          .contains(widget.docRef)) {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await widget.docRef!.update({
                                          'up_votes': FieldValue.increment(1),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await currentUserReference!.update({
                                          'polls_downvoted':
                                              FieldValue.arrayRemove(
                                                  [widget.docRef]),
                                        });
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await widget.docRef!.update({
                                          'up_votes':
                                              FieldValue.increment(-(1)),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await currentUserReference!.update({
                                          'polls_downvoted':
                                              FieldValue.arrayUnion(
                                                  [widget.docRef]),
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!isWeb)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    Icons.ios_share,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 13.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'QUEST_CARD_COMP_ios_share_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_share');
                                    await Share.share(
                                      functions.getPollLink(widget.docRef!.id)!,
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
