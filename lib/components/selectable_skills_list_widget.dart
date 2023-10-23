import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/components/selectable_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectable_skills_list_model.dart';
export 'selectable_skills_list_model.dart';

class SelectableSkillsListWidget extends StatefulWidget {
  const SelectableSkillsListWidget({
    Key? key,
    required this.selectedServiceCategory,
    this.selectedSkills,
  }) : super(key: key);

  final String? selectedServiceCategory;
  final List<SkillStruct>? selectedSkills;

  @override
  _SelectableSkillsListWidgetState createState() =>
      _SelectableSkillsListWidgetState();
}

class _SelectableSkillsListWidgetState
    extends State<SelectableSkillsListWidget> {
  late SelectableSkillsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectableSkillsListModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.getServicesCall.call(
        category:
            '[[\"skill_category_name\",\"=\",\"${widget.selectedServiceCategory}\"]]',
        apiGlobalKey: FFAppState().apiKey,
        fields: '[\"skill_name\",\"name\"]',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final gridViewGetServicesResponse = snapshot.data!;
        return Builder(
          builder: (context) {
            final services = TaskerpageBackendGroup.getServicesCall
                    .servicesList(
                      gridViewGetServicesResponse.jsonBody,
                    )
                    ?.map((e) =>
                        e != null && e != '' ? SkillStruct.fromMap(e) : null)
                    .withoutNulls
                    .toList()
                    ?.toList() ??
                [];
            if (services.isEmpty) {
              return EmtyContainerWidget(
                title: 'Choose a skill category !',
                goTo: () async {},
              );
            }
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 4.2,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: services.length,
              itemBuilder: (context, servicesIndex) {
                final servicesItem = services[servicesIndex];
                return wrapWithModel(
                  model: _model.selectableBoxModels.getModel(
                    servicesItem.skill,
                    servicesIndex,
                  ),
                  updateCallback: () => setState(() {}),
                  child: SelectableBoxWidget(
                    key: Key(
                      'Keycv4_${servicesItem.skill}',
                    ),
                    isActive: widget.selectedSkills!
                            .where((e) => e.skill == servicesItem.skill)
                            .toList()
                            .length >
                        0,
                    label: servicesItem.skillName,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
