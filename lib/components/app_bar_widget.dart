import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    Key? key,
    bool? showLeftIcon,
    this.showRightIcon,
  })  : this.showLeftIcon = showLeftIcon ?? false,
        super(key: key);

  final bool showLeftIcon;
  final bool? showRightIcon;

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('APP_BAR_COMP_Image_r0spltxa_ON_TAP');
                logFirebaseEvent('Image_navigate_to');

                context.pushNamed('Feed');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: 35.0,
                  height: 30.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => Switch.adaptive(
                    value: _model.switchValue ??= !valueOrDefault<bool>(
                        currentUserDocument?.allowNsfw, false),
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'APP_BAR_Switch_p3sua398_ON_TOGGLE_ON');
                        logFirebaseEvent('Switch_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          allowNsfw: true,
                        ));
                      } else {
                        logFirebaseEvent(
                            'APP_BAR_Switch_p3sua398_ON_TOGGLE_OFF');
                        logFirebaseEvent('Switch_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          allowNsfw: false,
                        ));
                      }
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      valueOrDefault<String>(
                        valueOrDefault<bool>(
                                currentUserDocument?.allowNsfw, false)
                            ? 'Unfiltered'
                            : 'Safe Feed',
                        'Safe Feed',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            if (widget.showRightIcon ?? true)
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.menu_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('APP_BAR_COMP_menu_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('Menu');
                },
              ),
          ],
        ),
      ),
    );
  }
}
