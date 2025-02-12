import 'package:buzzup/core/common/domain/entities/upload_job.entity.dart';
import 'package:buzzup/core/enums/upload_status.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:uuid/uuid.dart';

part 'upload_job.model.mapper.dart';

@MappableClass()
class UploadJobModel extends UploadJobEntity with UploadJobModelMappable {
  UploadJobModel({
    required super.uid,
    required super.userUid,
    required super.itemUid,
    required super.createdAt,
    required super.updatedAt,
    required super.status,
    required super.progress,
    required super.totalFiles,
    required super.completedFiles,
    required super.fileIds,
    super.errorMessage,
  });

  factory UploadJobModel.initial({
    required String id,
    required String userUid,
    required int totalFiles,
  }) {
    return UploadJobModel(
      uid: id,
      userUid: userUid,
      itemUid: const Uuid().v4(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: UploadStatus.pending,
      progress: 0,
      totalFiles: totalFiles,
      completedFiles: 0,
      fileIds: [],
    );
  }

  factory UploadJobModel.fromEntity(UploadJobEntity entity) {
    return UploadJobModel(
      uid: entity.uid,
      userUid: entity.userUid,
      itemUid: entity.itemUid,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      status: entity.status,
      progress: entity.progress,
      totalFiles: entity.totalFiles,
      completedFiles: entity.completedFiles,
      fileIds: entity.fileIds,
      errorMessage: entity.errorMessage,
    );
  }

  UploadJobEntity toEntity() {
    return UploadJobEntity(
      uid: uid,
      userUid: userUid,
      itemUid: itemUid,
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status,
      progress: progress,
      totalFiles: totalFiles,
      completedFiles: completedFiles,
      fileIds: fileIds,
      errorMessage: errorMessage,
    );
  }
}
