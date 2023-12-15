import '/backend/schema/structs/index.dart';
import '/components/categories_card_widget.dart';
import '/components/chooseacategoriestoget_started_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_categories_model.dart';
export 'home_page_categories_model.dart';

class HomePageCategoriesWidget extends StatefulWidget {
  const HomePageCategoriesWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final CategoriesInputStruct? categories;

  @override
  _HomePageCategoriesWidgetState createState() =>
      _HomePageCategoriesWidgetState();
}

class _HomePageCategoriesWidgetState extends State<HomePageCategoriesWidget> {
  late HomePageCategoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCategoriesModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.chooseacategoriestogetStartedModel,
          updateCallback: () => setState(() {}),
          child: ChooseacategoriestogetStartedWidget(
            title: widget.categories!.title,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 15.0, 32.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final categories =
                        widget.categories?.selectedCategories?.toList() ?? [];
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 1.85,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: categories.length,
                      itemBuilder: (context, categoriesIndex) {
                        final categoriesItem = categories[categoriesIndex];
                        return CategoriesCardWidget(
                          key: Key(
                              'Key82f_${categoriesIndex}_of_${categories.length}'),
                          categoriesCard: categoriesItem,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 23.0, 32.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 14.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Back',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
