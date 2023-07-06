import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'count_label_model.dart';
export 'count_label_model.dart';

class CountLabelWidget extends StatefulWidget {
  const CountLabelWidget({
    Key? key,
    this.label,
    this.count,
  }) : super(key: key);

  final String? label;
  final String? count;

  @override
  _CountLabelWidgetState createState() => _CountLabelWidgetState();
}

class _CountLabelWidgetState extends State<CountLabelWidget> {
  late CountLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountLabelModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 30.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
            child: Text(
              widget.label!,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          Text(
            widget.count!,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Barlow Condensed',
                ),
          ),
        ],
      ),
    );
  }
}
