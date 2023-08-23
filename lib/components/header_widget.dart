import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  final Future<dynamic> Function()? openDrawer;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: Color(0xFFF7F8FF),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 4.0),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.openDrawer?.call();
                    },
                    child: Icon(
                      Icons.menu_rounded,
                      color: Color(0xFF5450E2),
                      size: 25.0,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Artboard_2.png',
                    width: 91.0,
                    height: 17.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xFF5450E2),
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: Color(0xFF5450E2),
                    size: 23.0,
                  ),
                ),
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
                    width: 37.0,
                    height: 37.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      FFAppState().UserInformation.avatar != null &&
                              FFAppState().UserInformation.avatar != ''
                          ? 'https://taskerpage.darkube.app${FFAppState().UserInformation.avatar}'
                          : 'https://picsum.photos/see/508/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
