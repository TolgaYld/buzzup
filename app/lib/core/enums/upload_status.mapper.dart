// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'upload_status.dart';

class UploadStatusMapper extends EnumMapper<UploadStatus> {
  UploadStatusMapper._();

  static UploadStatusMapper? _instance;
  static UploadStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadStatusMapper._());
    }
    return _instance!;
  }

  static UploadStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  UploadStatus decode(dynamic value) {
    switch (value) {
      case 'pending':
        return UploadStatus.pending;
      case 'uploading':
        return UploadStatus.uploading;
      case 'processing':
        return UploadStatus.processing;
      case 'done':
        return UploadStatus.done;
      case 'error':
        return UploadStatus.error;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(UploadStatus self) {
    switch (self) {
      case UploadStatus.pending:
        return 'pending';
      case UploadStatus.uploading:
        return 'uploading';
      case UploadStatus.processing:
        return 'processing';
      case UploadStatus.done:
        return 'done';
      case UploadStatus.error:
        return 'error';
    }
  }
}

extension UploadStatusMapperExtension on UploadStatus {
  String toValue() {
    UploadStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<UploadStatus>(this) as String;
  }
}
