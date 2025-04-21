import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'chat_bot_widget.dart' show ChatBotWidget;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatBotModel extends FlutterFlowModel<ChatBotWidget> {
  ///  Local state fields for this page.

  String aiResponse = 'Response will display here';

  ///  State fields for stateful widgets in this page.

  // State field(s) for promptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GeminiChat)] action in Button widget.
  ApiCallResponse? apiResult94j;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();
  }
}
