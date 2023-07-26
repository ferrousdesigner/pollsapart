import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quest_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          StickyHeader(
            overlapHeaders: false,
            header: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
              child: FutureBuilder<List<CategoriesRecord>>(
                future: queryCategoriesRecordOnce(
                  queryBuilder: (categoriesRecord) =>
                      categoriesRecord.orderBy('category_name'),
                ),
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
                  List<CategoriesRecord> dropDownCategoriesRecordList =
                      snapshot.data!;
                  return FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= 'AI',
                    ),
                    options: dropDownCategoriesRecordList
                        .map((e) => e.categoryName)
                        .toList(),
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue = val);
                      logFirebaseEvent(
                          'TRENDING_POLLS_DropDown_46lhp1g2_ON_FORM');
                      logFirebaseEvent('DropDown_update_app_state');
                      setState(() {
                        FFAppState().currentCategory = _model.dropDownValue!;
                      });
                    },
                    width: MediaQuery.sizeOf(context).width * 0.92,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelMedium,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Select a topic',
                    searchHintText: 'Select a topic',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderWidth: 1.0,
                    borderRadius: 20.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                  );
                },
              ),
            ),
            content: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: PagedListView<DocumentSnapshot<Object?>?, PollsRecord>(
                  pagingController: _model.setListViewController(
                    PollsRecord.collection
                        .where('category',
                            isEqualTo: FFAppState().currentCategory)
                        .orderBy('up_votes', descending: true),
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
                      final listViewPollsRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
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

                              await currentUserReference!
                                  .update(createUsersRecordData(
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
            ),
          ),
        ],
      ),
    );
  }
}
