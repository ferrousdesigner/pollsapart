import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/count_label_widget.dart';
import '/components/profile_poll_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'public_profile_model.dart';
export 'public_profile_model.dart';

class PublicProfileWidget extends StatefulWidget {
  const PublicProfileWidget({
    Key? key,
    required this.userRefParam,
  }) : super(key: key);

  final DocumentReference? userRefParam;

  @override
  _PublicProfileWidgetState createState() => _PublicProfileWidgetState();
}

class _PublicProfileWidgetState extends State<PublicProfileWidget> {
  late PublicProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PublicProfile'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRefParam!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
          );
        }
        final publicProfileUsersRecord = snapshot.data!;
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
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
                                  Text(
                                    valueOrDefault<String>(
                                      publicProfileUsersRecord.displayName,
                                      'John Doe',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Barlow Condensed',
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      publicProfileUsersRecord.bio,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.countLabelModel1,
                                        updateCallback: () => setState(() {}),
                                        child: CountLabelWidget(
                                          label: 'Polls',
                                          count: valueOrDefault<String>(
                                            formatNumber(
                                              publicProfileUsersRecord
                                                  .pollsCreated.length,
                                              formatType: FormatType.compact,
                                            ),
                                            '0',
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.countLabelModel2,
                                        updateCallback: () => setState(() {}),
                                        child: CountLabelWidget(
                                          label: 'Voted',
                                          count: valueOrDefault<String>(
                                            formatNumber(
                                              publicProfileUsersRecord
                                                  .pollsAnswered.length,
                                              formatType: FormatType.compact,
                                            ),
                                            '0',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 120.0,
                              height: 120.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  publicProfileUsersRecord.photoUrl,
                                  'https://firebasestorage.googleapis.com/v0/b/binosophy.appspot.com/o/assets%2FPollsapart%20Default.png?alt=media&token=44294253-c963-4676-838a-9b08e98b0d08',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              tabs: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.pen,
                                        size: 20.0,
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
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Icon(
                                        Icons.thumbs_up_down,
                                      ),
                                    ),
                                    Tab(
                                      text: 'Voted',
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
                                  builder: (context) => wrapWithModel(
                                    model: _model.profilePollListModel1,
                                    updateCallback: () => setState(() {}),
                                    child: ProfilePollListWidget(
                                      pollRefList:
                                          publicProfileUsersRecord.pollsCreated,
                                      canDelete: false,
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.profilePollListModel2,
                                    updateCallback: () => setState(() {}),
                                    child: ProfilePollListWidget(
                                      pollRefList: publicProfileUsersRecord
                                          .pollsAnswered,
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
      },
    );
  }
}
