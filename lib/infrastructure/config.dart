import 'package:injectable/injectable.dart';

enum Environment { dev, stage, prod }

const _DEV = 'dev';
const _STAGE = 'stage';
const _PROD = 'prod';

@singleton
class AppConfig {
  final Environment environment;

  AppConfig() : environment = environmentFromEnv();

  // Workaround for web, fromEnvironment can be accessed only on compile time so it has to be static const
  static const String _baseUrl = String.fromEnvironment('BASE_URL');

  String get baseUrl => _baseUrl;

  static Environment environmentFromEnv() {
    const stringEnv = String.fromEnvironment('ENV', defaultValue: _DEV);

    switch (stringEnv) {
      case _STAGE:
        return Environment.stage;
      case _PROD:
        return Environment.prod;
      case _DEV:
      default:
        return Environment.dev;
    }
  }
}
