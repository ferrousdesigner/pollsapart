import '/backend/backend.dart';
import '/components/quest_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_poll_list_model.dart';
export 'profile_poll_list_model.dart';

class ProfilePollListWidget extends StatefulWidget {
  const ProfilePollListWidget({
    Key? key,
    required this.pollRefList,
    this.canDelete,
  }) : super(key: key);

  final List<DocumentReference>? pollRefList;
  final bool? canDelete;

  @override
  _ProfilePollListWidgetState createState() => _ProfilePollListWidgetState();
}

class _ProfilePollListWidgetState extends State<ProfilePollListWidget> {
  late ProfilePollListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePollListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
      child: Builder(
        builder: (context) {
          final pollList = widget.pollRefList!.toList();
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: pollList.length,
            itemBuilder: (context, pollListIndex) {
              final pollListItem = pollList[pollListIndex];
              return StreamBuilder<PollsRecord>(
                stream: PollsRecord.getDocument(pollListItem),
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
                  final questCardPollsRecord = snapshot.data!;
                  return QuestCardWidget(
                    key: Key('Keyf5j_${pollListIndex}_of_${pollList.length}'),
                    question: questCardPollsRecord.question,
                    optionOne: questCardPollsRecord.optionOne,
                    optionTwo: questCardPollsRecord.optionTwo,
                    docRef: questCardPollsRecord.reference,
                    upVotes: questCardPollsRecord.upVotes,
                    isNSFW: questCardPollsRecord.isNsfw,
                    canDelete: widget.canDelete,
                    createdAt: dateTimeFormat(
                        'relative', questCardPollsRecord.createdAt),
                    createdBy: questCardPollsRecord.createdBy,
                    isDeleted: questCardPollsRecord.isDeleted,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
