import 'package:dart_mappable/dart_mappable.dart';

part "upload_status.mapper.dart";

@MappableEnum()
enum UploadStatus {
  @MappableValue('pending')
  pending,
  @MappableValue('uploading')
  uploading,
  @MappableValue('uploaded')
  uploaded,
  @MappableValue('transformation')
  transformation,
  @MappableValue('transformed')
  transformed,
  @MappableValue('reuplaoding')
  reuploading,
  @MappableValue('reuploaded')
  reuploaded,
  @MappableValue('done')
  done,
  @MappableValue('error')
  error,
}
