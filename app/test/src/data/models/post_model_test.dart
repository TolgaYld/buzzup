import 'dart:convert';

import 'package:buzzup/core/models/all_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/core/utils/typedefs.dart';

import '../../../fixtures/reader.dart';

void main() {
  final tPostModel = Post.empty();

  test('should be a subclass of [Post] entity', () {
    expect(tPostModel, isA<Post>());
  });

  final tJson = jsonDecode(fixture('post/post.json')) as DataMap;

  group('fromJson', () {
    test('should return a valid [Post] from json', () {
      final result = PostMapper.fromMap(tJson);

      expect(result, isA<Post>());
      expect(result, tPostModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = PostMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model', () {
      final result = tPostModel.toJson();

      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a valid [PostModel] with updated values', () {
      final result = tPostModel.copyWith(id: 'copyWith');

      expect(result.id, 'copyWith');
    });
  });
}
