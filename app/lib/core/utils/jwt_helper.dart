import 'dart:convert';

class JwtHelper {
  static DateTime? getExpiryDate(String token) {
    try {
      final parts = token.split('.');
      final payload = base64Url.normalize(parts[1]);
      final decoded = jsonDecode(utf8.decode(base64Url.decode(payload)));
      if (decoded['exp'] != null) {
        return DateTime.fromMillisecondsSinceEpoch(decoded['exp'] * 1000);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static bool isExpired(String token) {
    final expiryDate = getExpiryDate(token);
    return expiryDate != null && expiryDate.isBefore(DateTime.now());
  }
}
