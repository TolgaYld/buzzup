import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'token.model.mapper.dart';

@MappableClass()
class TokenModel extends TokenEntity with TokenModelMappable {
  TokenModel({
    required super.token,
    required super.refreshToken,
    required super.firebaseAccessToken,
  });

  factory TokenModel.empty() => TokenModel(
        token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2MwNzMyNzJmZWRlN'
            'zgzOWMyMjM3ZSIsImlhdCI6MTcwNzg3MDAwMiwiZXhwIjoxNzA3ODgwODAyfQ.odC1'
            'ejoQUItZSG0VQLFe5pexq25yRqWRPXCyUEo_NL8',
        refreshToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2MwNzMyNzJmZWRlN'
            'zgzOWMyMjM3ZSIsImlhdCI6MTcwNzg3MDAwMiwiZXhwIjoxNzEwNDYyMDAyfQ.xWZD'
            'HO7mzI9ZpiPIAwn49mNvfbbJEpaq-p8DbsL2Gtw',
        firebaseAccessToken: "firebaseAccessToken",
      );

  factory TokenModel.fromEntity(TokenEntity entity) => TokenModel(
        token: entity.token,
        refreshToken: entity.refreshToken,
        firebaseAccessToken: entity.firebaseAccessToken,
      );

  TokenEntity toEntity() => TokenEntity(
        token: token,
        refreshToken: refreshToken,
        firebaseAccessToken: firebaseAccessToken,
      );
}
