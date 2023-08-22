import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'proflewelcome_model.dart';
export 'proflewelcome_model.dart';

class ProflewelcomeWidget extends StatefulWidget {
  const ProflewelcomeWidget({Key? key}) : super(key: key);

  @override
  _ProflewelcomeWidgetState createState() => _ProflewelcomeWidgetState();
}

class _ProflewelcomeWidgetState extends State<ProflewelcomeWidget> {
  late ProflewelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProflewelcomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => setState(() {}),
                child: HeaderWidget(
                  openDrawer: () async {},
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/image_2.png',
                  width: 270.0,
                  height: 380.0,
                  fit: BoxFit.none,
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0x33000000),
                      offset: Offset(5.0, 5.0),
                      spreadRadius: 10.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Profile-intersted');
                        },
                        child: wrapWithModel(
                          model: _model.buttonNextModel,
                          updateCallback: () => setState(() {}),
                          child: ButtonNextWidget(
                            text: 'Next',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
