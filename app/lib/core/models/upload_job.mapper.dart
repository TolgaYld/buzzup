// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'upload_job.dart';

class UploadJobMapper extends ClassMapperBase<UploadJob> {
  UploadJobMapper._();

  static UploadJobMapper? _instance;
  static UploadJobMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadJobMapper._());
      UploadStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadJob';

  static String _$uid(UploadJob v) => v.uid;
  static const Field<UploadJob, String> _f$uid = Field('uid', _$uid);
  static String _$userUid(UploadJob v) => v.userUid;
  static const Field<UploadJob, String> _f$userUid =
      Field('userUid', _$userUid);
  static String _$itemUid(UploadJob v) => v.itemUid;
  static const Field<UploadJob, String> _f$itemUid =
      Field('itemUid', _$itemUid);
  static DateTime _$createdAt(UploadJob v) => v.createdAt;
  static const Field<UploadJob, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime _$updatedAt(UploadJob v) => v.updatedAt;
  static const Field<UploadJob, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static UploadStatus _$status(UploadJob v) => v.status;
  static const Field<UploadJob, UploadStatus> _f$status =
      Field('status', _$status);
  static double _$progress(UploadJob v) => v.progress;
  static const Field<UploadJob, double> _f$progress =
      Field('progress', _$progress);
  static int _$totalFiles(UploadJob v) => v.totalFiles;
  static const Field<UploadJob, int> _f$totalFiles =
      Field('totalFiles', _$totalFiles);
  static int _$completedFiles(UploadJob v) => v.completedFiles;
  static const Field<UploadJob, int> _f$completedFiles =
      Field('completedFiles', _$completedFiles);
  static List<String> _$fileIds(UploadJob v) => v.fileIds;
  static const Field<UploadJob, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds);
  static String? _$errorMessage(UploadJob v) => v.errorMessage;
  static const Field<UploadJob, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true);

  @override
  final MappableFields<UploadJob> fields = const {
    #uid: _f$uid,
    #userUid: _f$userUid,
    #itemUid: _f$itemUid,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #status: _f$status,
    #progress: _f$progress,
    #totalFiles: _f$totalFiles,
    #completedFiles: _f$completedFiles,
    #fileIds: _f$fileIds,
    #errorMessage: _f$errorMessage,
  };

  static UploadJob _instantiate(DecodingData data) {
    return UploadJob(
        uid: data.dec(_f$uid),
        userUid: data.dec(_f$userUid),
        itemUid: data.dec(_f$itemUid),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        status: data.dec(_f$status),
        progress: data.dec(_f$progress),
        totalFiles: data.dec(_f$totalFiles),
        completedFiles: data.dec(_f$completedFiles),
        fileIds: data.dec(_f$fileIds),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadJob fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadJob>(map);
  }

  static UploadJob fromJson(String json) {
    return ensureInitialized().decodeJson<UploadJob>(json);
  }
}

mixin UploadJobMappable {
  String toJson() {
    return UploadJobMapper.ensureInitialized()
        .encodeJson<UploadJob>(this as UploadJob);
  }

  Map<String, dynamic> toMap() {
    return UploadJobMapper.ensureInitialized()
        .encodeMap<UploadJob>(this as UploadJob);
  }

  UploadJobCopyWith<UploadJob, UploadJob, UploadJob> get copyWith =>
      _UploadJobCopyWithImpl(this as UploadJob, $identity, $identity);
  @override
  String toString() {
    return UploadJobMapper.ensureInitialized()
        .stringifyValue(this as UploadJob);
  }

  @override
  bool operator ==(Object other) {
    return UploadJobMapper.ensureInitialized()
        .equalsValue(this as UploadJob, other);
  }

  @override
  int get hashCode {
    return UploadJobMapper.ensureInitialized().hashValue(this as UploadJob);
  }
}

extension UploadJobValueCopy<$R, $Out> on ObjectCopyWith<$R, UploadJob, $Out> {
  UploadJobCopyWith<$R, UploadJob, $Out> get $asUploadJob =>
      $base.as((v, t, t2) => _UploadJobCopyWithImpl(v, t, t2));
}

abstract class UploadJobCopyWith<$R, $In extends UploadJob, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds;
  $R call(
      {String? uid,
      String? userUid,
      String? itemUid,
      DateTime? createdAt,
      DateTime? updatedAt,
      UploadStatus? status,
      double? progress,
      int? totalFiles,
      int? completedFiles,
      List<String>? fileIds,
      String? errorMessage});
  UploadJobCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UploadJobCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadJob, $Out>
    implements UploadJobCopyWith<$R, UploadJob, $Out> {
  _UploadJobCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadJob> $mapper =
      UploadJobMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds =>
      ListCopyWith($value.fileIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileIds: v));
  @override
  $R call(
          {String? uid,
          String? userUid,
          String? itemUid,
          DateTime? createdAt,
          DateTime? updatedAt,
          UploadStatus? status,
          double? progress,
          int? totalFiles,
          int? completedFiles,
          List<String>? fileIds,
          Object? errorMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (uid != null) #uid: uid,
        if (userUid != null) #userUid: userUid,
        if (itemUid != null) #itemUid: itemUid,
        if (createdAt != null) #createdAt: createdAt,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (status != null) #status: status,
        if (progress != null) #progress: progress,
        if (totalFiles != null) #totalFiles: totalFiles,
        if (completedFiles != null) #completedFiles: completedFiles,
        if (fileIds != null) #fileIds: fileIds,
        if (errorMessage != $none) #errorMessage: errorMessage
      }));
  @override
  UploadJob $make(CopyWithData data) => UploadJob(
      uid: data.get(#uid, or: $value.uid),
      userUid: data.get(#userUid, or: $value.userUid),
      itemUid: data.get(#itemUid, or: $value.itemUid),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      status: data.get(#status, or: $value.status),
      progress: data.get(#progress, or: $value.progress),
      totalFiles: data.get(#totalFiles, or: $value.totalFiles),
      completedFiles: data.get(#completedFiles, or: $value.completedFiles),
      fileIds: data.get(#fileIds, or: $value.fileIds),
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  UploadJobCopyWith<$R2, UploadJob, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UploadJobCopyWithImpl($value, $cast, t);
}
