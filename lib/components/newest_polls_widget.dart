import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quest_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'newest_polls_model.dart';
export 'newest_polls_model.dart';

class NewestPollsWidget extends StatefulWidget {
  const NewestPollsWidget({Key? key}) : super(key: key);

  @override
  _NewestPollsWidgetState createState() => _NewestPollsWidgetState();
}

class _NewestPollsWidgetState extends State<NewestPollsWidget> {
  late NewestPollsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewestPollsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: PagedListView<DocumentSnapshot<Object?>?, PollsRecord>(
          pagingController: _model.setListViewController(
            PollsRecord.collection.orderBy('created_at', descending: true),
          ),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          reverse: false,
          scrollDirection: Axis.vertical,
          builderDelegate: PagedChildBuilderDelegate<PollsRecord>(
            // Customize what your widget looks like when it's loading the first page.
            firstPageProgressIndicatorBuilder: (_) => Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
            // Customize what your widget looks like when it's loading another page.
            newPageProgressIndicatorBuilder: (_) => Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
            noItemsFoundIndicatorBuilder: (_) => Center(
              child: SvgPicture.asset(
                'assets/images/undraw_no_data_re_kwbl_(1).svg',
                width: 100.0,
                height: 100.0,
              ),
            ),
            itemBuilder: (context, _, listViewIndex) {
              final listViewPollsRecord =
                  _model.listViewPagingController!.itemList![listViewIndex];
              return Visibility(
                visible: functions.canShowPoll(
                        valueOrDefault<bool>(
                            currentUserDocument?.allowNsfw, false),
                        listViewPollsRecord.isNsfw,
                        listViewPollsRecord.isDeleted) ??
                    true,
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onDoubleTap: () async {
                      logFirebaseEvent(
                          'NEWEST_POLLS_Container_lrr16w5x_ON_DOUBL');
                      logFirebaseEvent('QuestCard_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        email: '',
                      ));
                    },
                    child: wrapWithModel(
                      model: _model.questCardModels.getModel(
                        listViewPollsRecord.createdAt!.toString(),
                        listViewIndex,
                      ),
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: QuestCardWidget(
                        key: Key(
                          'Keylrr_${listViewPollsRecord.createdAt!.toString()}',
                        ),
                        question: listViewPollsRecord.question,
                        optionOne: listViewPollsRecord.optionOne,
                        optionTwo: listViewPollsRecord.optionTwo,
                        docRef: listViewPollsRecord.reference,
                        upVotes: listViewPollsRecord.upVotes,
                        isNSFW: listViewPollsRecord.isNsfw,
                        canDelete: false,
                        createdAt: dateTimeFormat(
                            'relative', listViewPollsRecord.createdAt),
                        createdBy: listViewPollsRecord.createdBy,
                        isDeleted: listViewPollsRecord.isDeleted,
                        isAnonymous: listViewPollsRecord.isAnonymous,
                        category: listViewPollsRecord.category,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
