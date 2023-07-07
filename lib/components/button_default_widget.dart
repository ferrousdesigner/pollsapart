import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_default_model.dart';
export 'button_default_model.dart';

class ButtonDefaultWidget extends StatefulWidget {
  const ButtonDefaultWidget({
    Key? key,
    String? label,
    this.disabled,
  })  : this.label = label ?? 'Click Me',
        super(key: key);

  final String label;
  final bool? disabled;

  @override
  _ButtonDefaultWidgetState createState() => _ButtonDefaultWidgetState();
}

class _ButtonDefaultWidgetState extends State<ButtonDefaultWidget> {
  late ButtonDefaultModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonDefaultModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: FFButtonWidget(
          onPressed: widget.disabled!
              ? null
              : () {
                  print('Button pressed ...');
                },
          text: widget.label,
          options: FFButtonOptions(
            width: double.infinity,
            height: 50.0,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).secondaryBackground,
            textStyle: TextStyle(
              color: FlutterFlowTheme.of(context).secondary,
              fontWeight: FontWeight.w600,
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
    );
  }
}
