import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    this.questionTwoImg,
    this.optionOneImg,
    required this.docRef,
    this.upVotes,
    bool? isNSFW,
    this.canDelete,
    this.createdAt,
  })  : this.question = question ?? 'Question Text',
        this.optionOne = optionOne ?? 'Option One',
        this.optionTwo = optionTwo ?? 'Option Two',
        this.isNSFW = isNSFW ?? false,
        super(key: key);

  final String question;
  final String optionOne;
  final String optionTwo;
  final String? questionTwoImg;
  final String? optionOneImg;
  final DocumentReference? docRef;
  final int? upVotes;
  final bool isNSFW;
  final bool? canDelete;
  final String? createdAt;

  @override
  _QuestCardWidgetState createState() => _QuestCardWidgetState();
}

class _QuestCardWidgetState extends State<QuestCardWidget>
    with TickerProviderStateMixin {
  late QuestCardModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 280.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.745,
                        height: 50.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            widget.question,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    if (!isWeb)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 30.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              Icons.ios_share,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'QUEST_CARD_COMP_Column_jurxan94_ON_TAP');
                      if ((currentUserDocument?.pollsAnswered?.toList() ?? [])
                          .contains(widget.docRef)) {
                        logFirebaseEvent('Column_navigate_to');

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
                        logFirebaseEvent('Column_backend_call');

                        await widget.docRef!.update({
                          ...createPollsRecordData(
                            modifiedAt: getCurrentTimestamp,
                          ),
                          'option_one_count': FieldValue.increment(1),
                        });
                        logFirebaseEvent('Column_backend_call');

                        await currentUserReference!.update({
                          'polls_answered':
                              FieldValue.arrayUnion([widget.docRef]),
                        });
                        logFirebaseEvent('Column_navigate_to');

                        context.pushNamed(
                          'PollMetric',
                          queryParameters: {
                            'pollRef': serializeParam(
                              widget.docRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Text(
                            widget.optionOne,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Hero(
                          tag: valueOrDefault<String>(
                            widget.optionOneImg,
                            'https://firebasestorage.googleapis.com/v0/b/binosophy.appspot.com/o/assets%2FPollsapart%20Default.png?alt=media&token=44294253-c963-4676-838a-9b08e98b0d08',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.optionOneImg,
                                'https://firebasestorage.googleapis.com/v0/b/binosophy.appspot.com/o/assets%2FPollsapart%20Default.png?alt=media&token=44294253-c963-4676-838a-9b08e98b0d08',
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation1']!),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'QUEST_CARD_COMP_Column_5flxclom_ON_TAP');
                      if ((currentUserDocument?.pollsAnswered?.toList() ?? [])
                          .contains(widget.docRef)) {
                        logFirebaseEvent('Column_navigate_to');

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
                        logFirebaseEvent('Column_backend_call');

                        await widget.docRef!.update({
                          ...createPollsRecordData(
                            modifiedAt: getCurrentTimestamp,
                          ),
                          'option_two_count': FieldValue.increment(1),
                        });
                        logFirebaseEvent('Column_backend_call');

                        await currentUserReference!.update({
                          'polls_answered':
                              FieldValue.arrayUnion([widget.docRef]),
                        });
                        logFirebaseEvent('Column_navigate_to');

                        context.pushNamed('Profile');
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Text(
                            widget.optionTwo,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Hero(
                          tag: valueOrDefault<String>(
                            widget.questionTwoImg,
                            'https://firebasestorage.googleapis.com/v0/b/binosophy.appspot.com/o/assets%2FPollsapart%20Default.png?alt=media&token=44294253-c963-4676-838a-9b08e98b0d08',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.questionTwoImg,
                                'https://firebasestorage.googleapis.com/v0/b/binosophy.appspot.com/o/assets%2FPollsapart%20Default.png?alt=media&token=44294253-c963-4676-838a-9b08e98b0d08',
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation2']!),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Text(
                                'Posted',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 8.0,
                                    ),
                              ),
                            ),
                            Text(
                              widget.createdAt!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        if (widget.canDelete == true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 30.0,
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
                      ],
                    ),
                    Container(
                      width: 120.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
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
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 30.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.thumb_up_off_alt,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 14.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'QUEST_CARD_thumb_up_off_alt_ICN_ON_TAP');
                                if (!(currentUserDocument?.pollsUpvoted
                                            ?.toList() ??
                                        [])
                                    .contains(widget.docRef)) {
                                  logFirebaseEvent('IconButton_backend_call');

                                  await widget.docRef!.update({
                                    'up_votes': FieldValue.increment(1),
                                  });
                                  logFirebaseEvent('IconButton_backend_call');

                                  await currentUserReference!.update({
                                    'polls_upvoted':
                                        FieldValue.arrayUnion([widget.docRef]),
                                  });
                                } else {
                                  logFirebaseEvent('IconButton_backend_call');

                                  await widget.docRef!.update({
                                    'up_votes': FieldValue.increment(-(1)),
                                  });
                                  logFirebaseEvent('IconButton_backend_call');

                                  await currentUserReference!.update({
                                    'polls_upvoted':
                                        FieldValue.arrayRemove([widget.docRef]),
                                  });
                                }
                              },
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
                                    fontSize: 10.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 30.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.thumb_down_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 13.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'QUEST_CARD_thumb_down_outlined_ICN_ON_TA');
                                if ((currentUserDocument?.pollsDownvoted
                                            ?.toList() ??
                                        [])
                                    .contains(widget.docRef)) {
                                  logFirebaseEvent('IconButton_backend_call');

                                  await widget.docRef!.update({
                                    'up_votes': FieldValue.increment(1),
                                  });
                                  logFirebaseEvent('IconButton_backend_call');

                                  await currentUserReference!.update({
                                    'polls_downvoted':
                                        FieldValue.arrayRemove([widget.docRef]),
                                  });
                                } else {
                                  logFirebaseEvent('IconButton_backend_call');

                                  await widget.docRef!.update({
                                    'up_votes': FieldValue.increment(-(1)),
                                  });
                                  logFirebaseEvent('IconButton_backend_call');

                                  await currentUserReference!.update({
                                    'polls_downvoted':
                                        FieldValue.arrayUnion([widget.docRef]),
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
