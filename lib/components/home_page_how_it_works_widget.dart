import '/backend/schema/structs/index.dart';
import '/components/how_it_works_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_how_it_works_model.dart';
export 'home_page_how_it_works_model.dart';

class HomePageHowItWorksWidget extends StatefulWidget {
  const HomePageHowItWorksWidget({
    Key? key,
    required this.howItWorks,
  }) : super(key: key);

  final HowItWorksInputStruct? howItWorks;

  @override
  _HomePageHowItWorksWidgetState createState() =>
      _HomePageHowItWorksWidgetState();
}

class _HomePageHowItWorksWidgetState extends State<HomePageHowItWorksWidget> {
  late HomePageHowItWorksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageHowItWorksModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(32.0, 38.0, 32.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 37.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.howItWorks?.title,
                    'How it works?',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF222222),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                final howItWorksItems =
                    widget.howItWorks?.featuredItems?.toList() ?? [];
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: howItWorksItems.length,
                  itemBuilder: (context, howItWorksItemsIndex) {
                    final howItWorksItemsItem =
                        howItWorksItems[howItWorksItemsIndex];
                    return HowItWorksItemWidget(
                      key: Key(
                          'Key2cz_${howItWorksItemsIndex}_of_${howItWorksItems.length}'),
                      howItWorksItem: howItWorksItemsItem,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
