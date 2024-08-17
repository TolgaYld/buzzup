import 'package:buzzup/core/errors/exception.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'failure.mapper.dart';

@MappableClass()
sealed class Failure with FailureMappable {
  Failure({
    required this.message,
    this.statusCode,
  });

  final String message;
  final int? statusCode;
}

@MappableClass()
class ApiFailure extends Failure with ApiFailureMappable {
  ApiFailure({
    required super.message,
    super.statusCode,
  });

  ApiFailure.fromException(ApiException exception)
      : super(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

@MappableClass()
class CacheFailure extends Failure with CacheFailureMappable {
  CacheFailure({
    required super.message,
    super.statusCode,
  });

  CacheFailure.fromException(CacheException exception)
      : super(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}

@MappableClass()
class GpsFailure extends Failure with GpsFailureMappable {
  GpsFailure({
    required super.message,
    super.statusCode,
  });

  GpsFailure.fromException(GpsException exception)
      : super(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}
