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

  static String _$uid(UploadJobModel v) => v.uid;
  static const Field<UploadJobModel, String> _f$uid = Field('uid', _$uid);
  static String _$userUid(UploadJobModel v) => v.userUid;
  static const Field<UploadJobModel, String> _f$userUid =
      Field('userUid', _$userUid);
  static String _$itemUid(UploadJobModel v) => v.itemUid;
  static const Field<UploadJobModel, String> _f$itemUid =
      Field('itemUid', _$itemUid);
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
  static List<String> _$fileIds(UploadJobModel v) => v.fileIds;
  static const Field<UploadJobModel, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds);
  static String? _$errorMessage(UploadJobModel v) => v.errorMessage;
  static const Field<UploadJobModel, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, opt: true);

  @override
  final MappableFields<UploadJobModel> fields = const {
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

  static UploadJobModel _instantiate(DecodingData data) {
    return UploadJobModel(
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
  UploadJobModel $make(CopyWithData data) => UploadJobModel(
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
  UploadJobModelCopyWith<$R2, UploadJobModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UploadJobModelCopyWithImpl($value, $cast, t);
}
