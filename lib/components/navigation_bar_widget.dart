import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_model.dart';
export 'navigation_bar_model.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({
    Key? key,
    required this.currentPage,
    this.postId,
  }) : super(key: key);

  final String? currentPage;
  final String? postId;

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late NavigationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarModel());

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
      height: 39.0,
      decoration: BoxDecoration(
        color: Color(0x00F6F6F6),
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: Color(0xFF5450E2),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 14.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'Task-1',
                  queryParameters: {
                    'id': serializeParam(
                      widget.postId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Icon(
                Icons.category_rounded,
                color: widget.currentPage == 'task1'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.postId != null && widget.postId != '') {
                  context.pushNamed(
                    'Task-2',
                    queryParameters: {
                      'id': serializeParam(
                        widget.postId,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }
              },
              child: Icon(
                Icons.file_copy_rounded,
                color: widget.currentPage == 'task2'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.postId != null && widget.postId != '') {
                  context.pushNamed(
                    'Select_Address',
                    queryParameters: {
                      'id': serializeParam(
                        widget.postId,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }
              },
              child: Icon(
                Icons.add_location_alt,
                color: widget.currentPage == 'select_address'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'Calendar',
                  queryParameters: {
                    'id': serializeParam(
                      widget.postId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Icon(
                Icons.calendar_month,
                color: widget.currentPage == 'calender'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'Taskertype',
                  queryParameters: {
                    'id': serializeParam(
                      widget.postId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Icon(
                Icons.people_alt_sharp,
                color: widget.currentPage == 'tasker_type1'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'Taskertype2',
                  queryParameters: {
                    'id': serializeParam(
                      widget.postId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Icon(
                Icons.handyman,
                color: widget.currentPage == 'tasker_type2'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'Taskertype3',
                  queryParameters: {
                    'id': serializeParam(
                      widget.postId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Icon(
                Icons.radar,
                color: widget.currentPage == 'tasker_type3'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
              child: VerticalDivider(
                thickness: 1.0,
                color: Color(0xFF5450E2),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'TaskView',
                  queryParameters: {
                    'id': serializeParam(
                      int.tryParse(widget.postId!),
                      ParamType.int,
                    ),
                  }.withoutNulls,
                );
              },
              child: Icon(
                Icons.remove_red_eye_outlined,
                color: widget.currentPage == 'task_periviewe'
                    ? Color(0xFF5450E2)
                    : Color(0x3E57636C),
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
