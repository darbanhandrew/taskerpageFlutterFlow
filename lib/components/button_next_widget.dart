import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_next_model.dart';
export 'button_next_model.dart';

class ButtonNextWidget extends StatefulWidget {
  const ButtonNextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  _ButtonNextWidgetState createState() => _ButtonNextWidgetState();
}

class _ButtonNextWidgetState extends State<ButtonNextWidget> {
  late ButtonNextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonNextModel());

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

    return Container(
      width: 104.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0xFF5450E2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: 14.0,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
