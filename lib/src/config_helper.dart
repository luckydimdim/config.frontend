import 'package:angular2/core.dart';

/**
 * Хелпер: комбинирует значения из конфига
 */
class ConfigHelper {
  bool production = false;

  String minLogLevel = '';

  String backendScheme = '';
  String backendBaseUrl = '';
  String backendPort = '';
  String backendUrl = '';
  String backendSuffix = '';
  String contractsUrl = '';
  String usersUrl = '';
  String logsUrl = '';
  String callOffOrdersUrl = '';
  String requestsUrl = '';
  String timeSheetsUrl = '';
  String authUrl = '';

  ConfigHelper(String environment) {

    environment = environment.toLowerCase();

    // Настройки для локальной отладки

    if (environment == 'test') {
      // Настройки для выклдаки на сервер
      production = true;

      minLogLevel = 'error';

      backendScheme = 'http';
      backendBaseUrl = 'cm-ylng-msk-01';
      backendSuffix = '/cmas-backend';
      backendPort = '80';
    }
    else if (environment == 'production') {
      // Настройки для выклдаки на сервер
      production = true;

      minLogLevel = 'error';

      backendScheme = 'http';
      backendBaseUrl = 'cm-ylng-msk-05';
      backendSuffix = '/backend';
      backendPort = '80';
    }
    else {
      production = false;

      minLogLevel = 'debug';

      backendScheme = 'http';
      backendBaseUrl = 'localhost';
      backendSuffix = '';
      backendPort = '5000';
    }

    backendUrl = '$backendScheme://$backendBaseUrl:$backendPort$backendSuffix';
    contractsUrl = '$backendUrl/contracts';
    usersUrl = '$backendUrl/users';
    logsUrl = '$backendUrl/log';
    callOffOrdersUrl = '$backendUrl/call-off-orders';
    requestsUrl = '$backendUrl/requests';
    timeSheetsUrl = '$backendUrl/time-sheets';
    authUrl = '$backendUrl/auth';
  }
}