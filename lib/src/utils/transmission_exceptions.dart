part of transmission_api;

///Base exception
class TransmissionException<T> implements Exception {
  final String message;
  final T? orginal;
  final StackTrace? stackTrace;

  const TransmissionException(this.message, {this.orginal, this.stackTrace});

  @override
  String toString() =>
      'TransmissionException(message: $message, orginal: $orginal, stackTrace: $stackTrace)';
}

class TransmissionDioError extends TransmissionException<DioException> {
  final int? statusCode;

  const TransmissionDioError(
    super.message, {
    required DioException super.orginal,
    this.statusCode,
  });

  @override
  String toString() =>
      'TransmissionDioError(message: $message,orginal:$orginal, statusCode: $statusCode)';
}

class TransmissionOtherException extends TransmissionException<dynamic> {
  const TransmissionOtherException(
    super.message, {
    super.orginal,
    super.stackTrace,
  });

  @override
  String toString() =>
      'TransmissionDioError(message: $message,orginal:$orginal, stackTrace:$stackTrace)';
}
