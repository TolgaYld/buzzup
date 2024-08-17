import 'dart:convert';

import 'package:buzzup/core/models/comment.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fixtures/reader.dart';

void main() {
  final tCommentModel = Comment.empty();

  test('should be a subclass of [Comment] entity', () {
    expect(tCommentModel, isA<Comment>());
  });

  final tJson = jsonDecode(fixture('comment/comment.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [CommentModel] from json', () {
      final result = CommentMapper.fromMap(tJson);

      expect(result, isA<Comment>());
      expect(result, tCommentModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = CommentMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model',
        () {
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
