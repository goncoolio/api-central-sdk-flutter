import 'package:dio/dio.dart';

import 'case_converter.dart';

/// Traduit les corps de requête en `snake_case` et les réponses en `camelCase`.
class CaseInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data != null) {
      options.data = deepToSnakeCase(options.data);
    }
    if (options.queryParameters.isNotEmpty) {
      final converted = deepToSnakeCase(options.queryParameters);
      options.queryParameters = (converted! as Map).cast<String, dynamic>();
    }
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    response.data = deepToCamelCase(response.data);
    handler.next(response);
  }
}
