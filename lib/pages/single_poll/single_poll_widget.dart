import '/backend/backend.dart';
import '/components/app_bar_widget.dart';
import '/components/quest_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_poll_model.dart';
export 'single_poll_model.dart';

class SinglePollWidget extends StatefulWidget {
  const SinglePollWidget({
    Key? key,
    required this.pollRef,
  }) : super(key: key);

  final DocumentReference? pollRef;

  @override
  _SinglePollWidgetState createState() => _SinglePollWidgetState();
}

class _SinglePollWidgetState extends State<SinglePollWidget> {
  late SinglePollModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinglePollModel());
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<PollsRecord>(
                    stream: PollsRecord.getDocument(widget.pollRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      final questCardPollsRecord = snapshot.data!;
                      return wrapWithModel(
                        model: _model.questCardModel,
                        updateCallback: () => setState(() {}),
                        child: QuestCardWidget(
                          question: questCardPollsRecord.question,
                          optionOne: questCardPollsRecord.optionOne,
                          optionTwo: questCardPollsRecord.optionTwo,
                          questionTwoImg: questCardPollsRecord.optionTwoImg,
                          optionOneImg: questCardPollsRecord.optionOneImg,
                          upVotes: questCardPollsRecord.upVotes,
                          isNSFW: questCardPollsRecord.isNsfw,
                          canDelete: false,
                          docRef: widget.pollRef!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
