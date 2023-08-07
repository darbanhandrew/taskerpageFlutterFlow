import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_post_task_model.dart';
export 'button_post_task_model.dart';

class ButtonPostTaskWidget extends StatefulWidget {
  const ButtonPostTaskWidget({Key? key}) : super(key: key);

  @override
  _ButtonPostTaskWidgetState createState() => _ButtonPostTaskWidgetState();
}

class _ButtonPostTaskWidgetState extends State<ButtonPostTaskWidget> {
  late ButtonPostTaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonPostTaskModel());

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
      width: 103.0,
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
            'Post a Task',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: 14.0,
                ),
          ),
        ],
      ),
    );
  }
}
