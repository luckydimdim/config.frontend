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
  String logsUrl = '';
  String callOffOrdersUrl = '';
  String requestsUrl = '';

  ConfigHelper(bool isDebug) {

    // Настройки для локальной отладки
    if (isDebug) {
      production = false;

      minLogLevel = 'debug';

      backendScheme = 'http';
      backendBaseUrl = 'localhost';
      backendSuffix = '';
      backendPort = '5000';
    } else {
      // Настройки для выклдаки на сервер
      production = true;

      minLogLevel = 'error';

      backendScheme = 'http';
      backendBaseUrl = 'cm-ylng-msk-01';
      backendSuffix = '/cmas-backend';
      backendPort = '80';
    }

    backendUrl = '$backendScheme://$backendBaseUrl:$backendPort$backendSuffix';
    contractsUrl = '$backendUrl/contracts';
    logsUrl = '$backendUrl/log';
    callOffOrdersUrl = '$backendUrl/call-off-orders';
    requestsUrl = '$backendUrl/requests';
  }
}