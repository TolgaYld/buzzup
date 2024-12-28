import 'package:dart_mappable/dart_mappable.dart';

part 'exception.mapper.dart';

@MappableClass()
class ApiException with ApiExceptionMappable implements Exception {
  ApiException({
    required this.message,
    this.isUnknownException = false,
    this.statusCode,
  });

  final String message;
  final bool isUnknownException;
  final int? statusCode;
}

@MappableClass()
class CacheException with CacheExceptionMappable implements Exception {
  CacheException({
    required this.message,
    this.statusCode = 500,
  });

  final String message;
  final int? statusCode;
}

@MappableClass()
class GpsException with GpsExceptionMappable implements Exception {
  GpsException({
    required this.message,
    this.statusCode = 500,
  });

  final String message;
  final int? statusCode;
}
