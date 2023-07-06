import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/text_field_double_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_abuse_model.dart';
export 'report_abuse_model.dart';

class ReportAbuseWidget extends StatefulWidget {
  const ReportAbuseWidget({
    Key? key,
    this.poll,
  }) : super(key: key);

  final PollsRecord? poll;

  @override
  _ReportAbuseWidgetState createState() => _ReportAbuseWidgetState();
}

class _ReportAbuseWidgetState extends State<ReportAbuseWidget> {
  late ReportAbuseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportAbuseModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ReportAbuse'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Report Abuse',
                          style: FlutterFlowTheme.of(context).displayLarge,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Let us know about the content you\'re concerned with. ',
                            style: FlutterFlowTheme.of(context).labelLarge,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            'I want to report a copyright violation.',
                            'I want to report a trademark violation.',
                            'I want to report a private information violation.',
                            'I want to report a threat of imminent physical harm to myself or another person because of content or behavior on Binosophy  ',
                            'I want to report abusive content or behavior    ',
                            'I don\'t see my problem here'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Select the reason...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Visibility(
                          visible: _model.dropDownValue ==
                              'I don\'t see my problem here',
                          child: wrapWithModel(
                            model: _model.textFieldDoubleModel,
                            updateCallback: () => setState(() {}),
                            child: TextFieldDoubleWidget(
                              label: 'Comment',
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: _model.dropDownValue != null &&
                                _model.dropDownValue != ''
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'REPORT_ABUSE_PAGE_REPORT_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                var reportAbusesRecordReference =
                                    ReportAbusesRecord.createDoc(
                                        widget.poll!.reference);
                                await reportAbusesRecordReference
                                    .set(createReportAbusesRecordData(
                                  createdBy: currentUserReference,
                                  reason: _model.dropDownValue,
                                  comments: _model
                                      .textFieldDoubleModel.textController.text,
                                ));
                                _model.savedAbuse =
                                    ReportAbusesRecord.getDocumentFromData(
                                        createReportAbusesRecordData(
                                          createdBy: currentUserReference,
                                          reason: _model.dropDownValue,
                                          comments: _model.textFieldDoubleModel
                                              .textController.text,
                                        ),
                                        reportAbusesRecordReference);
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!.update({
                                  'polls_banned': FieldValue.arrayUnion(
                                      [widget.poll!.reference]),
                                });
                                logFirebaseEvent('Button_backend_call');

                                await widget.poll!.reference.update({
                                  'report_abuses_count':
                                      FieldValue.increment(1),
                                });
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Noted. Thanks for the response.',
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
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('Feed');

                                setState(() {});
                              },
                        text: 'Report',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).bodySmall,
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'REPORT_ABUSE_PAGE_BACK_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_back');
                            context.safePop();
                          },
                          text: 'Back',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
