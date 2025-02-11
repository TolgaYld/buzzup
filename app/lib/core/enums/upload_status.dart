import 'package:dart_mappable/dart_mappable.dart';

part "upload_status.mapper.dart";

@MappableEnum()
enum UploadStatus { pending, uploading, processing, done, error }
