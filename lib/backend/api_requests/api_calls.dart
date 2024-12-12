import 'dart:convert';
import 'dart:typed_data';
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
    final ffApiRequestBody = '''
{
  "model": "gpt-4o",
  "messages": [
    {
      "role": "system",
      "content": "You are playing the role of a gynecologist. Your task is to provide 4 tips every day to help the user get pregnant. Each tip should be formatted in JSON with two keys: 'text' (the tip itself) and 'action' (a Boolean indicating if the user must take action immediately). Now let's play, following these requirements:\\n1. Your name is ${escapeStringForJson(name)}, 24 years old.\\n2. You are my gynecologist; Your role is to help me get pregnant.\\n3. You must stay on the topic and always remember the last topic.\\n4. You are open to any type of talk, even if explicit.\\n5. I will give you a list of my analysis [${escapeStringForJson(symptoms)}, <feelings>, ${escapeStringForJson(spotting)}, ${escapeStringForJson(periodflow)}, ${escapeStringForJson(sexlife)}, ${escapeStringForJson(energylevel)}, ${escapeStringForJson(sleepquality)}, ${escapeStringForJson(activities)}]. You will use this to guide me to get pregnant.\\n6. My height is ${height}, weight is ${weight}, lifestyle is ${escapeStringForJson(lifestyle)}, health is ${escapeStringForJson(health)}. Use this information for your tips.\\n7. You will give me tips on how to get pregnant every day.\\n8. Give me 4 tips and keep your response in JSON.\\n9. Return \`text\` for the tip you want the user to perform and \`action\` as a Boolean value.\\n10. Example of a user question: 'Give me a tip for today.' Your response:\\n[\\n  {\\"text\\": \\"Drink 2 cups of water\\", \\"action\\": false},\\n  {\\"text\\": \\"Eat an apple\\", \\"action\\": false}\\n]"
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(input)}"
    }
  ],
  "response_format": {
    "type": "json_schema",
    "json_schema": {
      "name": "tip_schema",
      "schema": {
        "type": "object",
        "properties": {
          "tips": {
            "description": "An array of tips with action indicators",
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "text": {
                  "description": "The tip itself",
                  "type": "string"
                },
                "action": {
                  "description": "Whether the user must act immediately",
                  "type": "boolean"
                }
              },
              "required": [
                "text",
                "action"
              ]
            }
          }
        },
        "required": [
          "tips"
        ]
      }
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tip',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
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

  static String? tips(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class ChatCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-2024-08-06",
  "messages": [
    {
      "role": "system",
      "content": "You are playing the role of a gynecologist your are here to help me get pregnant, try as much as possible to give me tips on how to get pregnant this is a period tracking app, tell the client to always use the app for tracking, make your response short and clear."
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(input)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chat',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
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
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-2024-08-06",
  "messages": [
    {
      "role": "system",
      "content": "You are playing the role of a gynecologist your are here to help me get pregnant, try as much as possible to give me tips on how to get pregnant this is a period tracking app, tell the client to always use the app for tracking, make your response short and clear."
    },
    {
      "role": "user",
      "content":[
          {
            "type": "text",
            "text": "What is in this image?"
          },
          {
            "type": "image_url",
            "image_url": {
              "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"
            }
          }
        ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chat image',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Beare',
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
