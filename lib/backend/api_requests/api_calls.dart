import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase auth Group Code

class SupabaseAuthGroup {
  static String getBaseUrl() => 'https://uzguwhbbweaefpbhznlb.supabase.co';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6Z3V3aGJid2VhZWZwYmh6bmxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk2MTkzMzUsImV4cCI6MjA0NTE5NTMzNX0._owmv-Jbf5iEXgOmmI_u6_qstH73JNhi54escOjGeRo',
    'Content-Type': 'application/json',
  };
  static SignupCall signupCall = SignupCall();
  static UpdateUserCall updateUserCall = UpdateUserCall();
}

class SignupCall {
  Future<ApiCallResponse> call({
    String? email = 'a@mailinator.com',
    String? password = '123456',
  }) async {
    final baseUrl = SupabaseAuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signup',
      apiUrl: '$baseUrl/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6Z3V3aGJid2VhZWZwYmh6bmxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk2MTkzMzUsImV4cCI6MjA0NTE5NTMzNX0._owmv-Jbf5iEXgOmmI_u6_qstH73JNhi54escOjGeRo',
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

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class UpdateUserCall {
  Future<ApiCallResponse> call({
    String? jwt = '1111',
    String? email = '1@mailinator.com',
    String? password = '123456',
  }) async {
    final baseUrl = SupabaseAuthGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "email": "someone@email.com",
  "password": "new-password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User',
      apiUrl: '$baseUrl/auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6Z3V3aGJid2VhZWZwYmh6bmxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk2MTkzMzUsImV4cCI6MjA0NTE5NTMzNX0._owmv-Jbf5iEXgOmmI_u6_qstH73JNhi54escOjGeRo',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
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
}

/// End Supabase auth Group Code

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
