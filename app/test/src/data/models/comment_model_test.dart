import 'dart:convert';

import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fixtures/reader.dart';

void main() {
  final tCommentModel = CommentModel.empty();

  test('should be a subclass of [Comment] entity', () {
    expect(tCommentModel, isA<CommentModel>());
  });

  final tJson = jsonDecode(fixture('comment/comment.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [Comment] from json', () {
      final result = CommentModelMapper.fromMap(tJson);

      expect(result, isA<CommentModel>());
      expect(result, tCommentModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = CommentModelMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model', () {
      final result = tCommentModel.toJson();

      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a valid [CommentModel] with updated values', () {
      final result = tCommentModel.copyWith(id: 'copyWith');

      expect(result.id, 'copyWith');
    });
  });
}
