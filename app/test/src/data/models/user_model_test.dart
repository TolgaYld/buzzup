import 'dart:convert';

import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/core/utils/typedefs.dart';

import '../../../fixtures/reader.dart';

void main() {
  final tUserModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {
    expect(tUserModel, isA<UserModel>());
  });

  final tJson = jsonDecode(fixture('user/user.json')) as DataMap;

  group('fromJson', () {
    test('should return a valid [User] from json', () {
      final result = UserModelMapper.fromMap(tJson);

      expect(result, isA<UserModel>());
      expect(result, tUserModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = UserModelMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model', () {
      final result = tUserModel.toJson();

      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a valid [UserModel] with updated values', () {
      final result = tUserModel.copyWith(id: 'copyWith');

      expect(result.id, 'copyWith');
    });
  });
}
