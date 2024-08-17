import 'package:dart_mappable/dart_mappable.dart';

part 'token.mapper.dart';

@MappableClass()
class Token with TokenMappable {
  Token({
    required this.token,
    required this.refreshToken,
  });

  factory Token.empty() => Token(
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2MwNzMyNzJmZWRlN'
            'zgzOWMyMjM3ZSIsImlhdCI6MTcwNzg3MDAwMiwiZXhwIjoxNzA3ODgwODAyfQ.odC1'
            'ejoQUItZSG0VQLFe5pexq25yRqWRPXCyUEo_NL8',
        refreshToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2MwNzMyNzJmZWRlN'
            'zgzOWMyMjM3ZSIsImlhdCI6MTcwNzg3MDAwMiwiZXhwIjoxNzEwNDYyMDAyfQ.xWZD'
            'HO7mzI9ZpiPIAwn49mNvfbbJEpaq-p8DbsL2Gtw',
      );

  final String token;
  final String refreshToken;
}
