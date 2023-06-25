import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_double_model.dart';
export 'text_field_double_model.dart';

class TextFieldDoubleWidget extends StatefulWidget {
  const TextFieldDoubleWidget({
    Key? key,
    this.hint,
    this.label,
    this.value,
  }) : super(key: key);

  final String? hint;
  final String? label;
  final String? value;

  @override
  _TextFieldDoubleWidgetState createState() => _TextFieldDoubleWidgetState();
}

class _TextFieldDoubleWidgetState extends State<TextFieldDoubleWidget> {
  late TextFieldDoubleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldDoubleModel());

    _model.textController ??= TextEditingController(text: widget.value);
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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          child: TextFormField(
            controller: _model.textController,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintText: widget.hint,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            maxLines: 2,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
      ),
    );
  }
}
