import 'dart:convert';

import 'package:buzzup/core/models/report.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/core/utils/typedefs.dart';

import '../../../fixtures/reader.dart';

void main() {
  final tReportModel = Report.empty();

  test('should be a subclass of [Report] entity', () {
    expect(tReportModel, isA<Report>());
  });

  final tJson = jsonDecode(fixture('report/report.json')) as DataMap;

  group('fromJson', () {
    test('should return a valid [ReportModel] from json', () {
      final result = ReportMapper.fromMap(tJson);

      expect(result, isA<Report>());
      expect(result, tReportModel);
    });

    test('should throw an [Error] when json is invalid', () {
      final map = DataMap.from(tJson)..remove('_id');

      const call = ReportMapper.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toJson', () {
    test('should return a valid [DataMap (Map<String,dynamic>)] from model',
        () {
      final result = tReportModel.toJson();

      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a valid [ReportModel] with updated values', () {
      final result = tReportModel.copyWith(id: 'copyWith');

      expect(result.id, 'copyWith');
    });
  });
}
