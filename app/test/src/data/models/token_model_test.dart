import 'dart:convert';

import 'package:buzzup/core/models/token.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/reader.dart';

void main() {
  final tTokenModel = Token.empty();

  final tJson = jsonDecode(fixture('tokens.json')) as DataMap;

  group('fromJson', () {
    test('should return a valid [TokenModel] from json', () {
      final result = TokenMapper.fromMap(tJson);

      expect(result, isA<Token>());
      expect(result, tTokenModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('refreshToken');

      const call = TokenMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model', () {
      final result = tTokenModel.toJson();

      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a valid [TokenModel] with updated values', () {
      final result = tTokenModel.copyWith(token: 'copyWith');

      expect(result.token, 'copyWith');
    });
  });
}
