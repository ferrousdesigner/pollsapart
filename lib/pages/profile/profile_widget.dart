import '/auth/firebase_auth/auth_util.dart';
import '/components/app_bar_widget.dart';
import '/components/count_label_widget.dart';
import '/components/profile_poll_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
                  showRightIcon: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 209.0,
                          height: 166.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  valueOrDefault<String>(
                                    currentUserDisplayName,
                                    'John Doe',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Barlow Condensed',
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault(
                                        currentUserDocument?.bio, ''),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.countLabelModel1,
                                      updateCallback: () => setState(() {}),
                                      child: CountLabelWidget(
                                        label: 'Polls',
                                        count: valueOrDefault<String>(
                                          formatNumber(
                                            (currentUserDocument?.pollsCreated
                                                        ?.toList() ??
                                                    [])
                                                .length,
                                            formatType: FormatType.compact,
                                          ),
                                          '0',
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.countLabelModel2,
                                      updateCallback: () => setState(() {}),
                                      child: CountLabelWidget(
                                        label: 'Voted',
                                        count: valueOrDefault<String>(
                                          formatNumber(
                                            (currentUserDocument?.pollsAnswered
                                                        ?.toList() ??
                                                    [])
                                                .length,
                                            formatType: FormatType.compact,
                                          ),
                                          '0',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 120.0,
                                height: 120.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://firebasestorage.googleapis.com/v0/b/binosophy.appspot.com/o/assets%2FPollsapart%20Default.png?alt=media&token=44294253-c963-4676-838a-9b08e98b0d08',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'UpdateProfile',
                                    queryParameters: {
                                      'message': serializeParam(
                                        'Update profile your and click save',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'Edit Profile',
                                options: FFButtonOptions(
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
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
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryText,
                          tabs: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.pen,
                                    size: 16.0,
                                  ),
                                ),
                                Tab(
                                  text: 'Created',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Icon(
                                    Icons.thumbs_up_down,
                                  ),
                                ),
                                Tab(
                                  text: 'Voted',
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Icon(
                                    Icons.favorite_sharp,
                                    size: 16.0,
                                  ),
                                ),
                                Tab(
                                  text: 'Saved',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            KeepAliveWidgetWrapper(
                              builder: (context) => AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.profilePollListModel1,
                                  updateCallback: () => setState(() {}),
                                  child: ProfilePollListWidget(
                                    pollRefList: (currentUserDocument
                                            ?.pollsCreated
                                            ?.toList() ??
                                        []),
                                    canDelete: true,
                                  ),
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.profilePollListModel2,
                                  updateCallback: () => setState(() {}),
                                  child: ProfilePollListWidget(
                                    pollRefList: (currentUserDocument
                                            ?.pollsAnswered
                                            ?.toList() ??
                                        []),
                                    canDelete: false,
                                  ),
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.profilePollListModel3,
                                  updateCallback: () => setState(() {}),
                                  child: ProfilePollListWidget(
                                    pollRefList: (currentUserDocument
                                            ?.pollsSaved
                                            ?.toList() ??
                                        []),
                                    canDelete: false,
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
            ],
          ),
        ),
      ),
    );
  }
}
