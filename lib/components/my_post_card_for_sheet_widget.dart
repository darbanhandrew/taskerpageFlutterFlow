import '/components/bid_on_tasker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_post_card_for_sheet_model.dart';
export 'my_post_card_for_sheet_model.dart';

class MyPostCardForSheetWidget extends StatefulWidget {
  const MyPostCardForSheetWidget({
    Key? key,
    required this.postData,
    required this.customerProfile,
  }) : super(key: key);

  final dynamic postData;
  final dynamic customerProfile;

  @override
  _MyPostCardForSheetWidgetState createState() =>
      _MyPostCardForSheetWidgetState();
}

class _MyPostCardForSheetWidgetState extends State<MyPostCardForSheetWidget> {
  late MyPostCardForSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPostCardForSheetModel());

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
        width: 326.0,
        height: 203.0,
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 18.0, 0.0),
                            child: Container(
                              width: 112.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF5450E2),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dateTimeFormat(
                                        'MMMEd',
                                        functions.jsonToDateTime(getJsonField(
                                          widget.postData,
                                          r'''$.creation''',
                                        ).toString())),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFFF6F6F6),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF5450E2),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 7.0, 8.0, 7.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      () {
                                        if (functions.jsonToInt(getJsonField(
                                              widget.postData,
                                              r'''$.docstatus''',
                                            )) ==
                                            1) {
                                          return 'Open';
                                        } else if (functions
                                                .jsonToInt(getJsonField(
                                              widget.postData,
                                              r'''$.docstatus''',
                                            )) ==
                                            2) {
                                          return 'Closed';
                                        } else {
                                          return 'Draft';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFFF6F6F6),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (functions.jsonToInt(getJsonField(
                                widget.postData,
                                r'''$.is_repeatable''',
                              )) ==
                              1)
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF5450E2),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 7.0, 8.0, 7.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      getJsonField(
                                        widget.postData,
                                        r'''$.repeat_type''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFFF6F6F6),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00C661),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 7.0, 10.0, 7.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Skill Cteagory',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFFF6F6F6),
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF00C661),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 7.0, 10.0, 7.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      getJsonField(
                                        widget.postData,
                                        r'''$.skill_name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFFF6F6F6),
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  11.0, 0.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFEA8433),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 7.0, 10.0, 7.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        functions
                                                    .jsonToInt(getJsonField(
                                                      widget.postData,
                                                      r'''$.docstatus''',
                                                    ))
                                                    .toString() ==
                                                '1'
                                            ? 'Published'
                                            : 'Draft',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFF6F6F6),
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                '${FFAppState().baseUrl}${getJsonField(
                                  widget.postData,
                                  r'''$.icon''',
                                ).toString()}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 32.0,
              thickness: 1.0,
              indent: 15.0,
              endIndent: 15.0,
              color: Color(0xFFDEDEDE),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/fas.png',
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Text(
                    '${getJsonField(
                      widget.postData,
                      r'''$.city''',
                    ).toString()}| ${getJsonField(
                      widget.postData,
                      r'''$.language''',
                    ).toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF222222),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getJsonField(
                      widget.postData,
                      r'''$.description''',
                    ).toString().maybeHandleOverflow(maxChars: 25),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF292929),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Icon(
                    Icons.share_outlined,
                    color: Color(0xFF5450E2),
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      back: Container(
        width: 326.0,
        height: 203.0,
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: BidOnTaskerWidget(
                        post: getJsonField(
                          widget.postData,
                          r'''$.name''',
                        ).toString(),
                        customerProfile: widget.customerProfile!,
                        action: () async {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Container(
                width: 168.0,
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
                      'bid on this post',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
    );
  }
}
