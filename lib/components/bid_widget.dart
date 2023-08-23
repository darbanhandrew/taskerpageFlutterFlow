import '/backend/api_requests/api_calls.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bid_model.dart';
export 'bid_model.dart';

class BidWidget extends StatefulWidget {
  const BidWidget({
    Key? key,
    required this.post,
    required this.bargaineeId,
  }) : super(key: key);

  final dynamic post;
  final int? bargaineeId;

  @override
  _BidWidgetState createState() => _BidWidgetState();
}

class _BidWidgetState extends State<BidWidget> {
  late BidModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BidModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().userFilter = '';
        FFAppState().BargainUserFilter = false;
      });
    });

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.55,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 124.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 11.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: wrapWithModel(
                            model: _model.taskCardModel,
                            updateCallback: () => setState(() {}),
                            child: TaskCardWidget(
                              post: widget.post!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Place your bid:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF212121),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.0,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF5E5D5D),
                                width: 1.0,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: enabled
                                    ? Color(0xFFF06543)
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              incrementIconBuilder: (enabled) => Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: enabled
                                    ? Color(0xFFF06543)
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 15.0,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 13.0,
                                    ),
                              ),
                              count: _model.countControllerValue ??= 160,
                              updateCount: (count) => setState(
                                  () => _model.countControllerValue = count),
                              stepSize: 1,
                              minimum: 0,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController1 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue1 ??= '\$',
                              ),
                              options: ['\$'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue1 = val),
                              width: 42.0,
                              height: 41.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 14.0,
                                  ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xFF3D3D3D),
                                size: 15.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Color(0xFF5E5D5D),
                              borderWidth: 1.0,
                              borderRadius: 5.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 4.0, 5.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue2 ??= 'Per hour',
                              ),
                              options: ['Per hour'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue2 = val),
                              width: 92.0,
                              height: 41.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 14.0,
                                  ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xFF3D3D3D),
                                size: 15.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Color(0xFF5E5D5D),
                              borderWidth: 1.0,
                              borderRadius: 5.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 4.0, 5.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              setState(() {
                                FFAppState().BidReq =
                                    '${_model.countControllerValue?.toString()} ${_model.dropDownValue1} ${_model.dropDownValue2}';
                              });
                              _model.bId = await TaskerpageBackendGroup
                                  .createBargainCall
                                  .call(
                                price: _model.countControllerValue,
                                postId: getJsonField(
                                  widget.post,
                                  r'''$.id''',
                                ),
                                apiGlobalKey: FFAppState().apiKey,
                                bargainer: getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.id''',
                                ),
                                bargainee: widget.bargaineeId,
                              );
                              _shouldSetState = true;
                              if ((_model.bId?.succeeded ?? true)) {
                                context.pushNamed('chat');
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: 160.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF5450E2),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Start Chat',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
