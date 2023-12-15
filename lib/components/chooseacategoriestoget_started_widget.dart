import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chooseacategoriestoget_started_model.dart';
export 'chooseacategoriestoget_started_model.dart';

class ChooseacategoriestogetStartedWidget extends StatefulWidget {
  const ChooseacategoriestogetStartedWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  _ChooseacategoriestogetStartedWidgetState createState() =>
      _ChooseacategoriestogetStartedWidgetState();
}

class _ChooseacategoriestogetStartedWidgetState
    extends State<ChooseacategoriestogetStartedWidget> {
  late ChooseacategoriestogetStartedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseacategoriestogetStartedModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(32.0, 33.0, 32.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            valueOrDefault<String>(
              widget.title,
              'Choose a categories to get Started:',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Color(0xFF222222),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
