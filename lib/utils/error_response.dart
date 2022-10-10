class ErrorResponse implements Exception {
  final String? code;
  final String? log;
  final int? statusCode;
  final String? message;

  ErrorResponse({
    this.code,
    this.log,
    this.statusCode,
    this.message,
  });

  ErrorResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        log = json['log'],
        statusCode = json['status_code'],
        message = json['message'];

  @override
  String toString() {
    return message!;
  }
}
