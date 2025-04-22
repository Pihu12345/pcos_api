import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for cycleRegularity widget.
  String? cycleRegularityValue;
  FormFieldController<String>? cycleRegularityValueController;
  // State field(s) for cycleLength widget.
  FocusNode? cycleLengthFocusNode;
  TextEditingController? cycleLengthTextController;
  String? Function(BuildContext, String?)? cycleLengthTextControllerValidator;
  // State field(s) for ahmLevels widget.
  FocusNode? ahmLevelsFocusNode;
  TextEditingController? ahmLevelsTextController;
  String? Function(BuildContext, String?)? ahmLevelsTextControllerValidator;
  // State field(s) for hairGrowth widget.
  String? hairGrowthValue;
  FormFieldController<String>? hairGrowthValueController;
  // State field(s) for pimples widget.
  String? pimplesValue;
  FormFieldController<String>? pimplesValueController;
  // State field(s) for skinDarkening widget.
  String? skinDarkeningValue;
  FormFieldController<String>? skinDarkeningValueController;
  // State field(s) for hairLoss widget.
  String? hairLossValue;
  FormFieldController<String>? hairLossValueController;
  // State field(s) for weightGain widget.
  String? weightGainValue;
  FormFieldController<String>? weightGainValueController;
  // State field(s) for fastFood widget.
  String? fastFoodValue;
  FormFieldController<String>? fastFoodValueController;
  // State field(s) for regExercise widget.
  String? regExerciseValue;
  FormFieldController<String>? regExerciseValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ageFocusNode?.dispose();
    ageTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    cycleLengthFocusNode?.dispose();
    cycleLengthTextController?.dispose();

    ahmLevelsFocusNode?.dispose();
    ahmLevelsTextController?.dispose();
  }
}
