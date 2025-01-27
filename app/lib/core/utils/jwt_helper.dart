import 'package:jwt_decoder/jwt_decoder.dart';

class JwtHelper {
  static DateTime? getExpiryDate(String token) {
    try {
      return JwtDecoder.getExpirationDate(token);
    } catch (e) {
      return null;
    }
  }

  static Duration substractDurationValuefFromExpiryDate = Duration(minutes: 3);

  static bool isExpired(String token) {
    try {
      final expiryDate = JwtDecoder.getExpirationDate(token);
      final duration = expiryDate.subtract(substractDurationValuefFromExpiryDate).difference(DateTime.now());
      return duration.isNegative || duration.inMicroseconds == 0;
    } catch (e) {
      return true;
    }
  }

  static bool isNotExpired(String token) => JwtDecoder.isExpired(token) == false;
}
