import '/backend/backend.dart';
import '/components/quest_card_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Search'});
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  'Search',
                                  style:
                                      FlutterFlowTheme.of(context).displayLarge,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Powered by',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                      ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Algolia-logo-blue.png',
                                    width: 70.0,
                                    height: 32.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textFieldModel,
                                updateCallback: () => setState(() {}),
                                child: TextFieldWidget(
                                  hint: 'Search',
                                  label: 'Search Polls',
                                  isDisabled: false,
                                ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 40.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            disabledColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              Icons.search_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                            onPressed: _model.textFieldModel.textController
                                            .text ==
                                        null ||
                                    _model.textFieldModel.textController.text ==
                                        ''
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'SEARCH_PAGE_search_sharp_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_algolia_search');
                                    setState(() =>
                                        _model.algoliaSearchResults = null);
                                    await PollsRecord.search(
                                      term: _model
                                          .textFieldModel.textController.text,
                                      maxResults: 30,
                                    )
                                        .then((r) =>
                                            _model.algoliaSearchResults = r)
                                        .onError((_, __) =>
                                            _model.algoliaSearchResults = [])
                                        .whenComplete(() => setState(() {}));
                                  },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Results ',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        Text(
                          '(',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.algoliaSearchResults?.length?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          ')',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.algoliaSearchResults?.map((e) => e).toList() ==
                          null) {
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
                      final results = _model.algoliaSearchResults
                              ?.map((e) => e)
                              .toList()
                              ?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: results.length,
                        itemBuilder: (context, resultsIndex) {
                          final resultsItem = results[resultsIndex];
                          return wrapWithModel(
                            model: _model.questCardModels.getModel(
                              resultsIndex.toString(),
                              resultsIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: QuestCardWidget(
                              key: Key(
                                'Keyqlu_${resultsIndex.toString()}',
                              ),
                              question: resultsItem.question,
                              optionOne: resultsItem.optionOne,
                              optionTwo: resultsItem.optionTwo,
                              upVotes: resultsItem.upVotes,
                              isNSFW: resultsItem.isNsfw,
                              canDelete: false,
                              docRef: resultsItem.reference,
                              createdAt: dateTimeFormat(
                                  'relative', resultsItem.createdAt),
                              isDeleted: resultsItem.isDeleted,
                              createdBy: resultsItem.createdBy,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
