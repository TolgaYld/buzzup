import 'package:buzzup/core/enums/upload_status.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:uuid/uuid.dart';

part 'upload_job.mapper.dart';

@MappableClass()
class UploadJob with UploadJobMappable {
  UploadJob({
    required this.uid,
    required this.userUid,
    required this.itemUid,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.progress,
    required this.totalFiles,
    required this.completedFiles,
    required this.fileIds,
    this.errorMessage,
  });

  factory UploadJob.initial({
    required String id,
    required String userUid,
    required int totalFiles,
  }) {
    return UploadJob(
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
  final String uid;
  final String userUid;
  final String itemUid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UploadStatus status;
  final double progress;
  final int totalFiles;
  final int completedFiles;
  final List<String> fileIds;
  final String? errorMessage;
}
