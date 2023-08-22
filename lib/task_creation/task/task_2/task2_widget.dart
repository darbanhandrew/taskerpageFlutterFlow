import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drope_down_languages_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task2_model.dart';
export 'task2_model.dart';

class Task2Widget extends StatefulWidget {
  const Task2Widget({Key? key}) : super(key: key);

  @override
  _Task2WidgetState createState() => _Task2WidgetState();
}

class _Task2WidgetState extends State<Task2Widget> {
  late Task2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Task2Model());

    _model.textController ??= TextEditingController();
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
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.headerModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderWidget(
                      openDrawer: () async {},
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Category',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Skills',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FutureBuilder<ApiCallResponse>(
                                future:
                                    TaskerpageBackendGroup.getServicesCall.call(
                                  category: FFAppState()
                                      .TaskCreation
                                      .relatedServiceCategory
                                      .toString(),
                                  apiGlobalKey: FFAppState().apiKey,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitThreeBounce(
                                          color: Color(0xFF5450E2),
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final gridViewGetServicesResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final services =
                                          TaskerpageBackendGroup.getServicesCall
                                                  .servicesList(
                                                    gridViewGetServicesResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 16.0,
                                          mainAxisSpacing: 8.0,
                                          childAspectRatio: 4.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: services.length,
                                        itemBuilder: (context, servicesIndex) {
                                          final servicesItem =
                                              services[servicesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState()
                                                    .updateTaskCreationStruct(
                                                  (e) => e
                                                    ..relatedService =
                                                        getJsonField(
                                                      servicesItem,
                                                      r'''$.id''',
                                                    ),
                                                );
                                              });
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                  color: getJsonField(
                                                            servicesItem,
                                                            r'''$.id''',
                                                          ) ==
                                                          FFAppState()
                                                              .TaskCreation
                                                              .relatedService
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .getTranslatableItemString(
                                                                getJsonField(
                                                                  servicesItem,
                                                                  r'''$.name''',
                                                                ),
                                                                'en'),
                                                        'selectedService',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF5E5D5D),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Skills Level',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            90.0, 10.0, 90.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final skillLevel =
                                functions.returnSkillLevelEnums().toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: skillLevel.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, skillLevelIndex) {
                                final skillLevelItem =
                                    skillLevel[skillLevelIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().updateTaskCreationStruct(
                                        (e) => e..skillLevel = skillLevelItem,
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 230.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .TaskCreation
                                                    .skillLevel ==
                                                skillLevelItem
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0x00000000),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          skillLevelItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFF5E5D5D),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Brings own tools',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF3D3D3D),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.switchValue1 ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue1 = newValue!);
                                  if (newValue!) {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..skillBringsowntools = true,
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..skillBringsowntools = false,
                                      );
                                    });
                                  }
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor: Color(0xFFFAD1C6),
                                inactiveTrackColor: Color(0xFFECECEC),
                                inactiveThumbColor: Color(0xFF3D3D3D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Buys material',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF3D3D3D),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.switchValue2 ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue2 = newValue!);
                                  if (newValue!) {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..skillBuysmaterial = true,
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState().updateUserInformationStruct(
                                        (e) => e..skillBuysmaterial = false,
                                      );
                                    });
                                  }
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor: Color(0xFFFAD1C6),
                                inactiveTrackColor: Color(0xFFECECEC),
                                inactiveThumbColor: Color(0xFF3D3D3D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Languages',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.dropeDownLanguagesModel,
                                updateCallback: () => setState(() {}),
                                child: DropeDownLanguagesWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Description',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController,
                                onFieldSubmitted: (_) async {
                                  setState(() {
                                    FFAppState().updateTaskCreationStruct(
                                      (e) => e
                                        ..description =
                                            _model.textController.text,
                                    );
                                  });
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Type Your Describtion ...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF3D3D3D),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE8083F),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE8083F),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF212121),
                                      fontSize: 14.0,
                                    ),
                                maxLines: 17,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 37.0),
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
                                final selectedFiles = await selectFiles(
                                  allowedExtensions: ['pdf'],
                                  multiFile: false,
                                );
                                if (selectedFiles != null) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedFiles
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedFiles.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 120.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5450E2),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload_outlined,
                                      color: Color(0xFFF6F6F6),
                                      size: 18.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Upload File',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFFF6F6F6),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              _model.uploadedLocalFile.height.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF494949),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Container(
                                      width: 96.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x005450E2),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: Color(0xFF5450E2),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color: Color(0xFF5450E2),
                                              size: 10.0,
                                            ),
                                          ),
                                          Text(
                                            'Back',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Color(0xFF5450E2),
                                                  fontSize: 14.0,
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
                                      var _shouldSetState = false;
                                      _model.apiResultv2j =
                                          await TaskerpageBackendGroup
                                              .updatePostCall
                                              .call(
                                        id: getJsonField(
                                          FFAppState().userProfile,
                                          r'''$.id''',
                                        ),
                                        apiGlobalKey: FFAppState().apiKey,
                                        relatedService: FFAppState()
                                            .TaskCreation
                                            .relatedService,
                                        skillLevel: FFAppState()
                                            .TaskCreation
                                            .skillLevel,
                                        taskerLanguagesList: FFAppState()
                                            .LanguagesListForDropDown,
                                        description: FFAppState()
                                            .TaskCreation
                                            .description,
                                      );
                                      _shouldSetState = true;
                                      if ((_model.apiResultv2j?.succeeded ??
                                          true)) {
                                        context.pushNamed('Select_Address');
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
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
