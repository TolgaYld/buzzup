import 'dart:convert';

import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/reader.dart';

void main() {
  final tChannelModel = Channel.empty();

  test('should be a subclass of [Channel] entity', () {
    expect(tChannelModel, isA<Channel>());
  });

  final tJson = jsonDecode(fixture('channel/channel.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [Channel] from map', () {
      final result = ChannelMapper.fromMap(tJson);

      expect(result, isA<Channel>());
      expect(result, tChannelModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = ChannelMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model', () {
      final result = tChannelModel.toMap();

      expect(result, tJson);
    });
  });

  // group('copyWith', () {
  //   test('should return a valid [ChannelModel] with updated values', () {
  //     final result = tChannelModel.copyWith(id: 'copyWith');

  //     expect(result.id, 'copyWith');
  //   });
  // });
}
