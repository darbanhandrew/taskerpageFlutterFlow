import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectable_box_model.dart';
export 'selectable_box_model.dart';

class SelectableBoxWidget extends StatefulWidget {
  const SelectableBoxWidget({
    Key? key,
    required this.isActive,
    required this.label,
  }) : super(key: key);

  final bool? isActive;
  final String? label;

  @override
  _SelectableBoxWidgetState createState() => _SelectableBoxWidgetState();
}

class _SelectableBoxWidgetState extends State<SelectableBoxWidget> {
  late SelectableBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectableBoxModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (_model.checkboxValue!) {
          setState(() {
            _model.checkboxValue = false;
          });
        } else {
          setState(() {
            _model.checkboxValue = true;
          });
        }
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: _model.checkboxValue!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).secondary,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  widget.label!.maybeHandleOverflow(
                    maxChars: 17,
                    replacement: '…',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: _model.checkboxValue!
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondary,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              if (false)
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= widget.isActive!,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxValue = newValue!);
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
