import 'package:dart_mappable/dart_mappable.dart';

part 'token.entity.mapper.dart';

@MappableClass()
class TokenEntity with TokenEntityMappable {
  TokenEntity({
    required this.token,
    required this.refreshToken,
    required this.firebaseAccessToken,
  });

  factory TokenEntity.empty() => TokenEntity(
        token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2MwNzMyNzJmZWRlN'
            'zgzOWMyMjM3ZSIsImlhdCI6MTcwNzg3MDAwMiwiZXhwIjoxNzA3ODgwODAyfQ.odC1'
            'ejoQUItZSG0VQLFe5pexq25yRqWRPXCyUEo_NL8',
        refreshToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2MwNzMyNzJmZWRlN'
            'zgzOWMyMjM3ZSIsImlhdCI6MTcwNzg3MDAwMiwiZXhwIjoxNzEwNDYyMDAyfQ.xWZD'
            'HO7mzI9ZpiPIAwn49mNvfbbJEpaq-p8DbsL2Gtw',
        firebaseAccessToken: "firebaseAccessToken",
      );

  final String token;
  final String refreshToken;
  final String? firebaseAccessToken;
}
