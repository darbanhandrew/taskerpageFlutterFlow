import '/components/dark_light_switch_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_content_model.dart';
export 'drawer_content_model.dart';

class DrawerContentWidget extends StatefulWidget {
  const DrawerContentWidget({Key? key}) : super(key: key);

  @override
  _DrawerContentWidgetState createState() => _DrawerContentWidgetState();
}

class _DrawerContentWidgetState extends State<DrawerContentWidget> {
  late DrawerContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerContentModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(25.0, 32.0, 25.0, 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().UserInformation.role == 'Poster') {
                    context.pushNamed('Poster_Profile');
                  } else {
                    context.pushNamed('Tasker_Profile');
                  }
                },
                child: Container(
                  width: 47.0,
                  height: 47.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/508/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.darkLightSwitchSmallModel,
                updateCallback: () => setState(() {}),
                child: DarkLightSwitchSmallWidget(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Mike Brown',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF0C0A3E),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Identification.png',
                      width: 18.0,
                      height: 18.0,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEF0EB0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tasker',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFF6F6F6),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF39F21),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Premium',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFF6F6F6),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ),
          Divider(
            height: 32.0,
            thickness: 1.0,
            color: Color(0xFF49A1FF),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.home_rounded,
                color: Color(0xFF212121),
                size: 22.0,
              ),
              Text(
                'Homepage',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF212121),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ].divide(SizedBox(width: 10.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.chair_rounded,
                  color: Color(0xFF212121),
                  size: 22.0,
                ),
                Text(
                  'Appointments',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.question_answer_rounded,
                  color: Color(0xFF212121),
                  size: 22.0,
                ),
                Text(
                  'Bargains',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.category_rounded,
                  color: Color(0xFF212121),
                  size: 22.0,
                ),
                Text(
                  'Categories',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.lightbulb,
                  color: Color(0xFF212121),
                  size: 22.0,
                ),
                Text(
                  'Knowledge Base',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.auto_awesome_motion_rounded,
                  color: Color(0xFF212121),
                  size: 22.0,
                ),
                Text(
                  'Plans',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.settings,
                  color: Color(0xFF212121),
                  size: 22.0,
                ),
                Text(
                  'Setting',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
