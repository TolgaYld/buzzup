import 'dart:convert';

import 'package:buzzup/core/models/story.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/core/utils/typedefs.dart';

import '../../../fixtures/reader.dart';

void main() {
  final tStoryModel = Story.empty();

  test('should be a subclass of [Story] entity', () {
    expect(tStoryModel, isA<Story>());
  });

  final tJson = jsonDecode(fixture('story/story.json')) as DataMap;

  group('fromJson', () {
    test('should return a valid [StoryModel] from json', () {
      final result = StoryMapper.fromMap(tJson);

      expect(result, isA<Story>());
      expect(result, tStoryModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = StoryMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model',
        () {
      final result = tStoryModel.toJson();

      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a valid [StoryModel] with updated values', () {
      final result = tStoryModel.copyWith(id: 'copyWith');

      expect(result.id, 'copyWith');
    });
  });
}
