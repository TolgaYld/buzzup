enum EnvironmentType {
  test,
  development,
  staging,
  production;
}

class Environment {
  Environment._();

  static const String environment = String.fromEnvironment("ENVIRONMENT");
  static const String baseUrl = String.fromEnvironment("BASE_URL");

  static final EnvironmentType type = switch (environment) {
    "development" => EnvironmentType.development,
    "staging" => EnvironmentType.staging,
    "production" => EnvironmentType.production,
    "test" => EnvironmentType.test,
    _ => throw ArgumentError('Unknown environment value: $environment'),
  };
}
