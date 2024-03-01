import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_card_model.dart';
export 'categories_card_model.dart';

class CategoriesCardWidget extends StatefulWidget {
  const CategoriesCardWidget({
    super.key,
    required this.categoriesCard,
  });

  final CategoriesCardInputStruct? categoriesCard;

  @override
  State<CategoriesCardWidget> createState() => _CategoriesCardWidgetState();
}

class _CategoriesCardWidgetState extends State<CategoriesCardWidget> {
  late CategoriesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesCardModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 0.0),
          )
        ],
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.7, 0.0, 11.2),
        child: FutureBuilder<ApiCallResponse>(
          future: TaskerpageBackendGroup.getSkillCategoryDetailsCall.call(
            name: widget.categoriesCard?.skillCategoryName,
            apiGlobalKey: FFAppState().apiKey,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 35.0,
                  height: 35.0,
                  child: SpinKitThreeBounce(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 35.0,
                  ),
                ),
              );
            }
            final columnGetSkillCategoryDetailsResponse = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 43.0,
                  height: 43.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      '${FFAppState().baseUrl}${CategoriesCardInputStruct.maybeFromMap(columnGetSkillCategoryDetailsResponse.jsonBody)?.icon}',
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.categoriesCard?.skillCategoryName,
                        'Category',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 4.1)),
            );
          },
        ),
      ),
    );
  }
}
