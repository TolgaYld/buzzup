import 'package:buzzup/core/common/base_interfaces/id_holder.dart';
import 'package:buzzup/core/common/domain/entities/upload_job.entity.dart';
import 'package:buzzup/core/enums/upload_status.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:uuid/uuid.dart';

part 'upload_job.model.mapper.dart';

@MappableClass()
class UploadJobModel extends UploadJobEntity with UploadJobModelMappable implements IdHolder {
  UploadJobModel({
    required super.id,
    required super.userId,
    required super.fileIds,
    required super.fileUris,
    required super.createdAt,
    required super.updatedAt,
    required super.status,
    required super.progress,
    required super.totalFiles,
    required super.completedFiles,
    super.errorMessage,
  });

  factory UploadJobModel.initial({
    required String id,
    required String userId,
    required int totalFiles,
  }) {
    return UploadJobModel(
      id: id,
      userId: userId,
      fileIds: [
        for (int i = 0; i < totalFiles; i++) Uuid().v4(),
      ],
      fileUris: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: UploadStatus.pending,
      progress: 0,
      totalFiles: totalFiles,
      completedFiles: 0,
    );
  }

  factory UploadJobModel.fromEntity(UploadJobEntity entity) {
    return UploadJobModel(
      id: entity.id,
      userId: entity.userId,
      fileIds: entity.fileIds,
      fileUris: entity.fileUris,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      status: entity.status,
      progress: entity.progress,
      totalFiles: entity.totalFiles,
      completedFiles: entity.completedFiles,
      errorMessage: entity.errorMessage,
    );
  }

  UploadJobEntity toEntity() {
    return UploadJobEntity(
      id: id,
      userId: userId,
      fileIds: fileIds,
      fileUris: fileUris,
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status,
      progress: progress,
      totalFiles: totalFiles,
      completedFiles: completedFiles,
      errorMessage: errorMessage,
    );
  }
}
