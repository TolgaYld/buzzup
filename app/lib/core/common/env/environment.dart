class Environment {
  Environment._();

  static const String environment = String.fromEnvironment("ENVIRONMENT");
  static const String baseUrl = String.fromEnvironment("BASE_URL");
  static const String permission = String.fromEnvironment("PERMISSION");
  static const String secretKey = String.fromEnvironment("SECRET_KEY");
}
