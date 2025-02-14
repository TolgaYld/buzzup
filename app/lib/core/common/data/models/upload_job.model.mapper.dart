// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'upload_job.model.dart';

class UploadJobModelMapper extends ClassMapperBase<UploadJobModel> {
  UploadJobModelMapper._();

  static UploadJobModelMapper? _instance;
  static UploadJobModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadJobModelMapper._());
      UploadJobEntityMapper.ensureInitialized();
      UploadStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadJobModel';

  static String _$id(UploadJobModel v) => v.id;
  static const Field<UploadJobModel, String> _f$id = Field('id', _$id);
  static String _$userId(UploadJobModel v) => v.userId;
  static const Field<UploadJobModel, String> _f$userId =
      Field('userId', _$userId);
  static List<String> _$fileIds(UploadJobModel v) => v.fileIds;
  static const Field<UploadJobModel, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds);
  static List<String> _$fileUris(UploadJobModel v) => v.fileUris;
  static const Field<UploadJobModel, List<String>> _f$fileUris =
      Field('fileUris', _$fileUris);
  static DateTime _$createdAt(UploadJobModel v) => v.createdAt;
  static const Field<UploadJobModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime _$updatedAt(UploadJobModel v) => v.updatedAt;
  static const Field<UploadJobModel, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static UploadStatus _$status(UploadJobModel v) => v.status;
  static const Field<UploadJobModel, UploadStatus> _f$status =
      Field('status', _$status);
  static double _$progress(UploadJobModel v) => v.progress;
  static const Field<UploadJobModel, double> _f$progress =
      Field('progress', _$progress);
  static int _$totalFiles(UploadJobModel v) => v.totalFiles;
  static const Field<UploadJobModel, int> _f$totalFiles =
      Field('totalFiles', _$totalFiles);
  static int _$completedFiles(UploadJobModel v) => v.completedFiles;
  static const Field<UploadJobModel, int> _f$completedFiles =
      Field('completedFiles', _$completedFiles);
  static String? _$errorMessage(UploadJobModel v) => v.errorMessage;
  static const Field<UploadJobModel, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true);

  @override
  final MappableFields<UploadJobModel> fields = const {
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

  static UploadJobModel _instantiate(DecodingData data) {
    return UploadJobModel(
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

  static UploadJobModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadJobModel>(map);
  }

  static UploadJobModel fromJson(String json) {
    return ensureInitialized().decodeJson<UploadJobModel>(json);
  }
}

mixin UploadJobModelMappable {
  String toJson() {
    return UploadJobModelMapper.ensureInitialized()
        .encodeJson<UploadJobModel>(this as UploadJobModel);
  }

  Map<String, dynamic> toMap() {
    return UploadJobModelMapper.ensureInitialized()
        .encodeMap<UploadJobModel>(this as UploadJobModel);
  }

  UploadJobModelCopyWith<UploadJobModel, UploadJobModel, UploadJobModel>
      get copyWith => _UploadJobModelCopyWithImpl(
          this as UploadJobModel, $identity, $identity);
  @override
  String toString() {
    return UploadJobModelMapper.ensureInitialized()
        .stringifyValue(this as UploadJobModel);
  }

  @override
  bool operator ==(Object other) {
    return UploadJobModelMapper.ensureInitialized()
        .equalsValue(this as UploadJobModel, other);
  }

  @override
  int get hashCode {
    return UploadJobModelMapper.ensureInitialized()
        .hashValue(this as UploadJobModel);
  }
}

extension UploadJobModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadJobModel, $Out> {
  UploadJobModelCopyWith<$R, UploadJobModel, $Out> get $asUploadJobModel =>
      $base.as((v, t, t2) => _UploadJobModelCopyWithImpl(v, t, t2));
}

abstract class UploadJobModelCopyWith<$R, $In extends UploadJobModel, $Out>
    implements UploadJobEntityCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileUris;
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
      String? errorMessage});
  UploadJobModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadJobModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadJobModel, $Out>
    implements UploadJobModelCopyWith<$R, UploadJobModel, $Out> {
  _UploadJobModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadJobModel> $mapper =
      UploadJobModelMapper.ensureInitialized();
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
  UploadJobModel $make(CopyWithData data) => UploadJobModel(
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
  UploadJobModelCopyWith<$R2, UploadJobModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UploadJobModelCopyWithImpl($value, $cast, t);
}
