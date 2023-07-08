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
import 'trending_polls_model.dart';
export 'trending_polls_model.dart';

class TrendingPollsWidget extends StatefulWidget {
  const TrendingPollsWidget({Key? key}) : super(key: key);

  @override
  _TrendingPollsWidgetState createState() => _TrendingPollsWidgetState();
}

class _TrendingPollsWidgetState extends State<TrendingPollsWidget> {
  late TrendingPollsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrendingPollsModel());
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
          pagingController: () {
            final Query<Object?> Function(Query<Object?>) queryBuilder =
                (pollsRecord) => pollsRecord
                    .where('category', isEqualTo: FFAppState().currentCategory)
                    .orderBy('created_at');
            if (_model.pagingController != null) {
              final query = queryBuilder(PollsRecord.collection);
              if (query != _model.pagingQuery) {
                // The query has changed
                _model.pagingQuery = query;
                _model.streamSubscriptions.forEach((s) => s?.cancel());
                _model.streamSubscriptions.clear();
                _model.pagingController!.refresh();
              }
              return _model.pagingController!;
            }

            _model.pagingController = PagingController(firstPageKey: null);
            _model.pagingQuery = queryBuilder(PollsRecord.collection);
            _model.pagingController!.addPageRequestListener((nextPageMarker) {
              queryPollsRecordPage(
                queryBuilder: (pollsRecord) => pollsRecord
                    .where('category', isEqualTo: FFAppState().currentCategory)
                    .orderBy('created_at'),
                nextPageMarker: nextPageMarker,
                pageSize: 5,
                isStream: true,
              ).then((page) {
                _model.pagingController!.appendPage(
                  page.data,
                  page.nextPageMarker,
                );
                final streamSubscription = page.dataStream?.listen((data) {
                  data.forEach((item) {
                    final itemIndexes = _model.pagingController!.itemList!
                        .asMap()
                        .map((k, v) => MapEntry(v.reference.id, k));
                    final index = itemIndexes[item.reference.id];
                    final items = _model.pagingController!.itemList!;
                    if (index != null) {
                      items.replaceRange(index, index + 1, [item]);
                      _model.pagingController!.itemList = {
                        for (var item in items) item.reference: item
                      }.values.toList();
                    }
                  });
                  setState(() {});
                });
                _model.streamSubscriptions.add(streamSubscription);
              });
            });
            return _model.pagingController!;
          }(),
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
                  color: FlutterFlowTheme.of(context).primary,
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
                  _model.pagingController!.itemList![listViewIndex];
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
                          'TRENDING_POLLS_Container_dgp5pc3t_ON_DOU');
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
                          'Keydgp_${listViewPollsRecord.createdAt!.toString()}',
                        ),
                        question: listViewPollsRecord.question,
                        optionOne: listViewPollsRecord.optionOne,
                        optionTwo: listViewPollsRecord.optionTwo,
                        questionTwoImg: listViewPollsRecord.optionTwoImg,
                        optionOneImg: listViewPollsRecord.optionOneImg,
                        docRef: listViewPollsRecord.reference,
                        upVotes: listViewPollsRecord.upVotes,
                        isNSFW: listViewPollsRecord.isNsfw,
                        canDelete: false,
                        createdAt: dateTimeFormat(
                            'relative', listViewPollsRecord.createdAt),
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
