part of transmission_api;

const csrfProtectionHeader = 'X-Transmission-Session-Id';

class CSRF extends QueuedInterceptorsWrapper {
  String? csrfToken;

  final Dio _dio;

  final Dio _tokenDio = Dio();

  CSRF(this._dio) {
    _tokenDio.options = _dio.options;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (csrfToken != null) {
      options.headers[csrfProtectionHeader] = csrfToken;
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == 409) {
      final options = error.requestOptions;
      // If the token has been updated, repeat directly.
      if (csrfToken != options.headers[csrfProtectionHeader]) {
        options.headers[csrfProtectionHeader] = csrfToken;
      } else {
        csrfToken = error.response!.headers[csrfProtectionHeader]!.first;
        options.headers[csrfProtectionHeader] = csrfToken;
      }
      //repeat
      try {
        final response = await _tokenDio.request(
          options.path,
          options: options.toOptions(),
          data: options.data,
          cancelToken: options.cancelToken,
          onReceiveProgress: options.onReceiveProgress,
          onSendProgress: options.onSendProgress,
          queryParameters: options.queryParameters,
        );
        handler.resolve(response);
      } on DioException catch (err) {
        handler.reject(err);
      } catch (err) {
        handler.reject(error);
      }
      return;
    }
    handler.next(error);
  }
}

extension RequestOptionsExtension on RequestOptions {
  Options toOptions() {
    return Options(
      responseType: responseType,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType,
      extra: extra,
      followRedirects: followRedirects,
      headers: headers,
      listFormat: listFormat,
      maxRedirects: maxRedirects,
      method: method,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      validateStatus: validateStatus,
    );
  }
}
