// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'upload_job.entity.dart';

class UploadJobEntityMapper extends ClassMapperBase<UploadJobEntity> {
  UploadJobEntityMapper._();

  static UploadJobEntityMapper? _instance;
  static UploadJobEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadJobEntityMapper._());
      UploadStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadJobEntity';

  static String _$id(UploadJobEntity v) => v.id;
  static const Field<UploadJobEntity, String> _f$id = Field('id', _$id);
  static String _$userId(UploadJobEntity v) => v.userId;
  static const Field<UploadJobEntity, String> _f$userId =
      Field('userId', _$userId);
  static List<String> _$fileIds(UploadJobEntity v) => v.fileIds;
  static const Field<UploadJobEntity, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds);
  static List<String> _$fileUris(UploadJobEntity v) => v.fileUris;
  static const Field<UploadJobEntity, List<String>> _f$fileUris =
      Field('fileUris', _$fileUris);
  static DateTime _$createdAt(UploadJobEntity v) => v.createdAt;
  static const Field<UploadJobEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime _$updatedAt(UploadJobEntity v) => v.updatedAt;
  static const Field<UploadJobEntity, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static UploadStatus _$status(UploadJobEntity v) => v.status;
  static const Field<UploadJobEntity, UploadStatus> _f$status =
      Field('status', _$status);
  static double _$progress(UploadJobEntity v) => v.progress;
  static const Field<UploadJobEntity, double> _f$progress =
      Field('progress', _$progress);
  static int _$totalFiles(UploadJobEntity v) => v.totalFiles;
  static const Field<UploadJobEntity, int> _f$totalFiles =
      Field('totalFiles', _$totalFiles);
  static int _$completedFiles(UploadJobEntity v) => v.completedFiles;
  static const Field<UploadJobEntity, int> _f$completedFiles =
      Field('completedFiles', _$completedFiles);
  static String? _$errorMessage(UploadJobEntity v) => v.errorMessage;
  static const Field<UploadJobEntity, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true);

  @override
  final MappableFields<UploadJobEntity> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #fileIds: _f$fileIds,
    #fileUris: _f$fileUris,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #status: _f$status,
    #progress: _f$progress,
    #totalFiles: _f$totalFiles,
    #completedFiles: _f$completedFiles,
    #errorMessage: _f$errorMessage,
  };

  static UploadJobEntity _instantiate(DecodingData data) {
    return UploadJobEntity(
        id: data.dec(_f$id),
        userId: data.dec(_f$userId),
        fileIds: data.dec(_f$fileIds),
        fileUris: data.dec(_f$fileUris),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        status: data.dec(_f$status),
        progress: data.dec(_f$progress),
        totalFiles: data.dec(_f$totalFiles),
        completedFiles: data.dec(_f$completedFiles),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadJobEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadJobEntity>(map);
  }

  static UploadJobEntity fromJson(String json) {
    return ensureInitialized().decodeJson<UploadJobEntity>(json);
  }
}

mixin UploadJobEntityMappable {
  String toJson() {
    return UploadJobEntityMapper.ensureInitialized()
        .encodeJson<UploadJobEntity>(this as UploadJobEntity);
  }

  Map<String, dynamic> toMap() {
    return UploadJobEntityMapper.ensureInitialized()
        .encodeMap<UploadJobEntity>(this as UploadJobEntity);
  }

  UploadJobEntityCopyWith<UploadJobEntity, UploadJobEntity, UploadJobEntity>
      get copyWith => _UploadJobEntityCopyWithImpl(
          this as UploadJobEntity, $identity, $identity);
  @override
  String toString() {
    return UploadJobEntityMapper.ensureInitialized()
        .stringifyValue(this as UploadJobEntity);
  }

  @override
  bool operator ==(Object other) {
    return UploadJobEntityMapper.ensureInitialized()
        .equalsValue(this as UploadJobEntity, other);
  }

  @override
  int get hashCode {
    return UploadJobEntityMapper.ensureInitialized()
        .hashValue(this as UploadJobEntity);
  }
}

extension UploadJobEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadJobEntity, $Out> {
  UploadJobEntityCopyWith<$R, UploadJobEntity, $Out> get $asUploadJobEntity =>
      $base.as((v, t, t2) => _UploadJobEntityCopyWithImpl(v, t, t2));
}

abstract class UploadJobEntityCopyWith<$R, $In extends UploadJobEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileUris;
  $R call(
      {String? id,
      String? userId,
      List<String>? fileIds,
      List<String>? fileUris,
      DateTime? createdAt,
      DateTime? updatedAt,
      UploadStatus? status,
      double? progress,
      int? totalFiles,
      int? completedFiles,
      String? errorMessage});
  UploadJobEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadJobEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadJobEntity, $Out>
    implements UploadJobEntityCopyWith<$R, UploadJobEntity, $Out> {
  _UploadJobEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadJobEntity> $mapper =
      UploadJobEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds =>
      ListCopyWith($value.fileIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileIds: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileUris =>
      ListCopyWith($value.fileUris, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileUris: v));
  @override
  $R call(
          {String? id,
          String? userId,
          List<String>? fileIds,
          List<String>? fileUris,
          DateTime? createdAt,
          DateTime? updatedAt,
          UploadStatus? status,
          double? progress,
          int? totalFiles,
          int? completedFiles,
          Object? errorMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (userId != null) #userId: userId,
        if (fileIds != null) #fileIds: fileIds,
        if (fileUris != null) #fileUris: fileUris,
        if (createdAt != null) #createdAt: createdAt,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (status != null) #status: status,
        if (progress != null) #progress: progress,
        if (totalFiles != null) #totalFiles: totalFiles,
        if (completedFiles != null) #completedFiles: completedFiles,
        if (errorMessage != $none) #errorMessage: errorMessage
      }));
  @override
  UploadJobEntity $make(CopyWithData data) => UploadJobEntity(
      id: data.get(#id, or: $value.id),
      userId: data.get(#userId, or: $value.userId),
      fileIds: data.get(#fileIds, or: $value.fileIds),
      fileUris: data.get(#fileUris, or: $value.fileUris),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      status: data.get(#status, or: $value.status),
      progress: data.get(#progress, or: $value.progress),
      totalFiles: data.get(#totalFiles, or: $value.totalFiles),
      completedFiles: data.get(#completedFiles, or: $value.completedFiles),
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  UploadJobEntityCopyWith<$R2, UploadJobEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UploadJobEntityCopyWithImpl($value, $cast, t);
}
