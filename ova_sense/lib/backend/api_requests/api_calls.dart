import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeminiChatCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "You are OvaSense, a friendly and knowledgeable virtual health assistant that helps Indian women understand, track, and manage PCOS and PCOD. Your job is to answer questions, explain medical terms in simple words, interpret symptoms and predictions, and give actionable advice related to PCOS/PCOD.Speak in a warm, supportive, and non-judgmental tone, like a trusted friend who cares about the user's health. Use simple, clear language and avoid overly technical jargon. If you mention medical terms, explain them briefly. If a user shares their symptoms or prediction score, provide possible interpretations and gently suggest lifestyle changes, home remedies, and when to consult a doctor. Encourage users and reassure them that PCOS/PCOD can be managed.Never make a diagnosis. If the user has serious or unclear symptoms, encourage them to see a medical professional.Format the response to look good and dont answer in more than 200 words.Now answer this:${escapeStringForJson(prompt)}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GeminiChat',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyAMRmND_rrKSDfrYnk0jHDicc8qem--iVI',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? testResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class PredictionPCOSCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "I   beta-HCG(mIU/mL)": "[[input_hcg1]]",
  "II    beta-HCG(mIU/mL)": "[[input_hcg2]]",
  "AMH(ng/mL)": "[[input_amh]]"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'predictionPCOS',
      apiUrl: 'https://pcos-api.onrender.com',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
