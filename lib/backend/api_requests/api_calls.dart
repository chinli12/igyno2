import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TipCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? symptoms = '',
    String? fellings = '',
    String? spotting = '',
    String? periodflow = '',
    String? sexlife = '',
    String? energylevel = '',
    String? sleepquality = '',
    String? activities = '',
    int? height,
    int? weight,
    String? lifestyle = '',
    String? health = '',
    String? input = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TipCall',
        'variables': {
          'name': name,
          'symptoms': symptoms,
          'fellings': fellings,
          'spotting': spotting,
          'periodflow': periodflow,
          'sexlife': sexlife,
          'energylevel': energylevel,
          'sleepquality': sleepquality,
          'activities': activities,
          'height': height,
          'weight': weight,
          'lifestyle': lifestyle,
          'health': health,
          'input': input,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? tips(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class ChatCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ChatCall',
        'variables': {
          'input': input,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class ChatImageCall {
  static Future<ApiCallResponse> call({
    String? input = '',
    String? image = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ChatImageCall',
        'variables': {
          'input': input,
          'image': image,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
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
