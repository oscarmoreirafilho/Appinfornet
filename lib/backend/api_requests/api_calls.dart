import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApiasaasCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? cpf = '',
    String? valor = '',
  }) async {
    final ffApiRequestBody = '''
{
  "billingType": "BOLETO",
  "chargeType": "DETACHED",
  "name": "${nome}",
  "description": "${cpf}",
  "value": "${valor}",
  "dueDateLimitDays": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'APIASAAS',
      apiUrl: 'https://sandbox.asaas.com/api/v3/paymentLinks',
      callType: ApiCallType.POST,
      headers: {
        'access_token':
            '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDAwNjY4NDM6OiRhYWNoXzRmODNmMmQ1LWNjNzMtNDQwNC1hNmZjLTQ0ZTg2NDhkYjljZQ==',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? linkdePagto(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.url''',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
