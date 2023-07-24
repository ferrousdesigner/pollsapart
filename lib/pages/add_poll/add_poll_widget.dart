import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/text_field_double_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'add_poll_model.dart';
export 'add_poll_model.dart';

class AddPollWidget extends StatefulWidget {
  const AddPollWidget({Key? key}) : super(key: key);

  @override
  _AddPollWidgetState createState() => _AddPollWidgetState();
}

class _AddPollWidgetState extends State<AddPollWidget> {
  late AddPollModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPollModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AddPoll'});
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
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 2.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Favicon_Pollsapart.png',
                                      width: 30.0,
                                      height: 40.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: GradientText(
                                    'Create a poll',
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge,
                                    colors: [
                                      Color(0xFFF12711),
                                      FlutterFlowTheme.of(context).primary
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  ),
                                ),
                              ],
                            ),
                            Form(
                              key: _model.formKey3,
                              autovalidateMode: AutovalidateMode.always,
                              child: wrapWithModel(
                                model: _model.textFieldDoubleModel,
                                updateCallback: () => setState(() {}),
                                child: TextFieldDoubleWidget(
                                  hint:
                                      'Example: Which operating system is better?',
                                  label: 'Question',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.42,
                                      decoration: BoxDecoration(),
                                      child: Form(
                                        key: _model.formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: wrapWithModel(
                                          model: _model.textFieldModel1,
                                          updateCallback: () => setState(() {}),
                                          child: TextFieldWidget(
                                            hint: 'Example: iOS',
                                            label: 'Option A',
                                            value: 'Yes',
                                            isDisabled: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.42,
                                      decoration: BoxDecoration(),
                                      child: Form(
                                        key: _model.formKey1,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: wrapWithModel(
                                          model: _model.textFieldModel2,
                                          updateCallback: () => setState(() {}),
                                          child: TextFieldWidget(
                                            hint: 'Example: Android',
                                            label: 'Option B',
                                            value: 'No',
                                            isDisabled: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: StreamBuilder<List<CategoriesRecord>>(
                                stream: queryCategoriesRecord(
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CategoriesRecord>
                                      dropDownCategoriesRecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: dropDownCategoriesRecordList
                                        .map((e) => e.categoryName)
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue = val),
                                    width: double.infinity,
                                    height: 50.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Please choose a topic',
                                    searchHintText: 'Search for category',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: true,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Switch.adaptive(
                                      value: _model.switchValue1 ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue1 = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  ),
                                  Text(
                                    'Anonymous poll',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Switch.adaptive(
                                      value: _model.switchValue2 ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue2 = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  ),
                                  Text(
                                    'NSFW',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  AlignedTooltip(
                                    content: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: Text(
                                          'Please enable this if the poll contains something sexual for not safe for work',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        )),
                                    offset: 4.0,
                                    preferredDirection: AxisDirection.down,
                                    borderRadius: BorderRadius.circular(8.0),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    elevation: 4.0,
                                    tailBaseWidth: 24.0,
                                    tailLength: 12.0,
                                    waitDuration: Duration(milliseconds: 100),
                                    showDuration: Duration(milliseconds: 1500),
                                    triggerMode: TooltipTriggerMode.tap,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.info_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Please make sure that your poll follows our',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ADD_POLL_PAGE_Text_br51ca0s_ON_TAP');
                                          logFirebaseEvent('Text_navigate_to');

                                          context
                                              .pushNamed('CommunityGuidelines');
                                        },
                                        child: Text(
                                          'Community Guidelines',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: !((_model.textFieldDoubleModel
                                                    .textController.text !=
                                                null &&
                                            _model.textFieldDoubleModel
                                                    .textController.text !=
                                                '') &&
                                        (_model.textFieldModel1.textController
                                                    .text !=
                                                null &&
                                            _model.textFieldModel1
                                                    .textController.text !=
                                                '') &&
                                        (_model.textFieldModel2.textController
                                                    .text !=
                                                null &&
                                            _model.textFieldModel2
                                                    .textController.text !=
                                                '') &&
                                        (_model.dropDownValue != null &&
                                            _model.dropDownValue != ''))
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'ADD_POLL_PAGE_CREATE_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        var pollsRecordReference =
                                            PollsRecord.collection.doc();
                                        await pollsRecordReference
                                            .set(createPollsRecordData(
                                          createdAt: getCurrentTimestamp,
                                          modifiedAt: getCurrentTimestamp,
                                          question: _model.textFieldDoubleModel
                                              .textController.text,
                                          optionOne: _model.textFieldModel1
                                              .textController.text,
                                          optionTwo: _model.textFieldModel2
                                              .textController.text,
                                          optionOneCount: 0,
                                          optionTwoCount: 0,
                                          createdBy: currentUserReference,
                                          isAnonymous: _model.switchValue1,
                                          upVotes: 0,
                                          isNsfw: _model.switchValue2,
                                          isBanned: false,
                                          reportAbusesCount: 0,
                                          category: _model.dropDownValue,
                                        ));
                                        _model.pollCreated =
                                            PollsRecord.getDocumentFromData(
                                                createPollsRecordData(
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  modifiedAt:
                                                      getCurrentTimestamp,
                                                  question: _model
                                                      .textFieldDoubleModel
                                                      .textController
                                                      .text,
                                                  optionOne: _model
                                                      .textFieldModel1
                                                      .textController
                                                      .text,
                                                  optionTwo: _model
                                                      .textFieldModel2
                                                      .textController
                                                      .text,
                                                  optionOneCount: 0,
                                                  optionTwoCount: 0,
                                                  createdBy:
                                                      currentUserReference,
                                                  isAnonymous:
                                                      _model.switchValue1,
                                                  upVotes: 0,
                                                  isNsfw: _model.switchValue2,
                                                  isBanned: false,
                                                  reportAbusesCount: 0,
                                                  category:
                                                      _model.dropDownValue,
                                                ),
                                                pollsRecordReference);
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          'polls_created':
                                              FieldValue.arrayUnion([
                                            _model.pollCreated?.reference
                                          ]),
                                        });
                                        logFirebaseEvent(
                                            'Button_firestore_query');
                                        _model.chosenCategory =
                                            await queryCategoriesRecordOnce(
                                          queryBuilder: (categoriesRecord) =>
                                              categoriesRecord.where(
                                                  'category_name',
                                                  isEqualTo:
                                                      _model.dropDownValue),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        logFirebaseEvent('Button_backend_call');

                                        await _model.chosenCategory!.reference
                                            .update({
                                          'polls_count':
                                              FieldValue.increment(1),
                                        });
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Poll Added',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed('Feed');

                                        setState(() {});
                                      },
                                text: 'Create',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                  disabledColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_POLL_PAGE_BACK_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('Feed');
                                },
                                text: 'Back',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
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
                    ],
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
