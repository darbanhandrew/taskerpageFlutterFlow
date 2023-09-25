import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'address_card_model.dart';
export 'address_card_model.dart';

class AddressCardWidget extends StatefulWidget {
  const AddressCardWidget({
    Key? key,
    required this.address,
    required this.action,
  }) : super(key: key);

  final dynamic address;
  final Future<dynamic> Function()? action;

  @override
  _AddressCardWidgetState createState() => _AddressCardWidgetState();
}

class _AddressCardWidgetState extends State<AddressCardWidget> {
  late AddressCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressCardModel());

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

    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Container(
        decoration: BoxDecoration(
          color: Color(0xFF5450E2),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 6.0),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.5, 16.0, 20.5, 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (functions
                      .jsonToInt(getJsonField(
                        widget.address,
                        r'''$.is_main_address''',
                      ))
                      .toString() ==
                  '1')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 122.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEF0EB0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Main Address',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFF6F6F6),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      getJsonField(
                        widget.address,
                        r'''$.address''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Color(0xFFF6F6F6),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (functions
                            .jsonToInt(getJsonField(
                              widget.address,
                              r'''$.is_main_address''',
                            ))
                            .toString() ==
                        '0')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            _model.apiResultzxfCopy =
                                await TaskerpageBackendGroup
                                    .changeMainAddressCall
                                    .call(
                              isMainAddress: 1,
                              id: getJsonField(
                                widget.address,
                                r'''$.name''',
                              ).toString(),
                              apiGlobalKey: FFAppState().apiKey,
                            );
                            _shouldSetState = true;
                            if ((_model.apiResultzxfCopy?.succeeded ?? true)) {
                              await widget.action?.call();
                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          child: Container(
                            width: 122.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF49A1FF),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Set to main',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFFF6F6F6),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Icon(
                      Icons.delete_outlined,
                      color: Color(0xFFF6F6F6),
                      size: 26.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
          color: Color(0xFF3D3D3D),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 35.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: 104.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3D3D3D),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Color(0xFF5450E2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cancel',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFFF6F6F6),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.apiResultqzc =
                          await TaskerpageBackendGroup.deleteAddressCall.call(
                        id: getJsonField(
                          widget.address,
                          r'''$.name''',
                        ),
                        apiGlobalKey: FFAppState().apiKey,
                      );
                      if ((_model.apiResultqzc?.succeeded ?? true)) {
                        await widget.action?.call();
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('LinkExistsError'),
                              content: Text(
                                  'you cant remove this address , This address has been used somewhere before !'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: 104.0,
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
                            'Delete',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFFF6F6F6),
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
    );
  }
}
