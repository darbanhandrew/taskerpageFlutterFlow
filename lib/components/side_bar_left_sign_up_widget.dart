import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_bar_left_sign_up_model.dart';
export 'side_bar_left_sign_up_model.dart';

class SideBarLeftSignUpWidget extends StatefulWidget {
  const SideBarLeftSignUpWidget({
    super.key,
    required this.selectedColor,
  });

  final int? selectedColor;

  @override
  State<SideBarLeftSignUpWidget> createState() =>
      _SideBarLeftSignUpWidgetState();
}

class _SideBarLeftSignUpWidgetState extends State<SideBarLeftSignUpWidget> {
  late SideBarLeftSignUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarLeftSignUpModel());

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
      width: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
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
              context.pushNamed('welcome');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.perm_identity_rounded,
                  color: widget.selectedColor == 1
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 1
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Contactdata-1');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.perm_contact_cal_outlined,
                  color: widget.selectedColor == 2
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Contact data',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 2
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Skills-3');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.checklist_rounded,
                  color: widget.selectedColor == 3
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Skills',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 3
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Profiledetails');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.person_add_alt_outlined,
                  color: widget.selectedColor == 4
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Profile details',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 4
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('ID1');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.badge_outlined,
                  color: widget.selectedColor == 5
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Identification',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 5
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Add_another_education');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.school_outlined,
                  color: widget.selectedColor == 6
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Education',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 6
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('RateSignUp');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.discount_outlined,
                  color: widget.selectedColor == 7
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                Text(
                  'Rates',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: widget.selectedColor == 7
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
        ].divide(SizedBox(height: 36.0)),
      ),
    );
  }
}
