import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/text_field_double_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'contact_us_model.dart';
export 'contact_us_model.dart';

class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({Key? key}) : super(key: key);

  @override
  _ContactUsWidgetState createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  late ContactUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactUsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ContactUs'});
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
                        child: GradientText(
                          'Contact Us',
                          style: FlutterFlowTheme.of(context).displayLarge,
                          colors: [
                            Color(0xFFF12711),
                            FlutterFlowTheme.of(context).primary
                          ],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.textFieldModel,
                        updateCallback: () => setState(() {}),
                        child: TextFieldWidget(
                          label: 'Email',
                          value: currentUserEmail,
                          isDisabled: true,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.textFieldDoubleModel,
                        updateCallback: () => setState(() {}),
                        child: TextFieldDoubleWidget(
                          label: 'Comment',
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: !((_model.textFieldModel.textController
                                            .text !=
                                        null &&
                                    _model.textFieldModel.textController.text !=
                                        '') &&
                                (_model.textFieldDoubleModel.textController
                                            .text !=
                                        null &&
                                    _model.textFieldDoubleModel.textController
                                            .text !=
                                        ''))
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'CONTACT_US_PAGE_SUBMIT_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await InquiriesRecord.collection
                                    .doc()
                                    .set(createInquiriesRecordData(
                                      email: _model
                                          .textFieldModel.textController.text,
                                      comment: _model.textFieldDoubleModel
                                          .textController.text,
                                      userRef: currentUserReference,
                                    ));
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Thanks for the submission.',
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
                                logFirebaseEvent('Button_navigate_back');
                                context.safePop();
                              },
                        text: 'Submit',
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
                            logFirebaseEvent('CONTACT_US_PAGE_BACK_BTN_ON_TAP');
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
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
