import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skill_options_check_component_model.dart';
export 'skill_options_check_component_model.dart';

class SkillOptionsCheckComponentWidget extends StatefulWidget {
  const SkillOptionsCheckComponentWidget({
    Key? key,
    required this.skillOption,
  }) : super(key: key);

  final dynamic skillOption;

  @override
  _SkillOptionsCheckComponentWidgetState createState() =>
      _SkillOptionsCheckComponentWidgetState();
}

class _SkillOptionsCheckComponentWidgetState
    extends State<SkillOptionsCheckComponentWidget> {
  late SkillOptionsCheckComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillOptionsCheckComponentModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          getJsonField(
            widget.skillOption,
            r'''$.option_name''',
          ).toString(),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lato',
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        Theme(
          data: ThemeData(
            checkboxTheme: CheckboxThemeData(
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
          ),
          child: Checkbox(
            value: _model.checkboxValue ??= false,
            onChanged: (newValue) async {
              setState(() => _model.checkboxValue = newValue!);
            },
            activeColor: FlutterFlowTheme.of(context).primary,
            checkColor: FlutterFlowTheme.of(context).info,
          ),
        ),
      ],
    );
  }
}
