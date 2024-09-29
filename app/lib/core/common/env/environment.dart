class Environment {
  Environment._();

  static const String environment = String.fromEnvironment("ENVIRONMENT");
  static const String baseUrl = String.fromEnvironment("BASE_URL");
}
