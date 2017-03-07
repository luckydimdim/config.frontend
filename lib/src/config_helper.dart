import 'package:angular2/core.dart';
import 'config_service.dart';

/**
 * Хелпер: комбинирует значения из конфига
 */
class ConfigHelper {
  ConfigService _service = null;

  String backendScheme = null;
  String backendBaseUrl = null;
  String backendPort = null;
  String backendUrl = null;
  String contractsUrl = null;
  String logsUrl = null;

  ConfigHelper(ConfigService service) {
    _service = service;

    _service.Get<String>('backend_scheme')
      .then((value) {
        backendScheme = value;
        _service.Get<String>('backend_base_url').then((value) {
          backendBaseUrl = value;
          _service.Get<String>('backend_port').then((value) {
            backendPort = value;
            backendUrl = '$backendScheme://$backendBaseUrl:$backendPort';
          }).then((value) {

            _service.Get<String>('backend_contracts').then((value) {
              contractsUrl = '$backendUrl/$value';
            });

            _service.Get<String>('backend_logs').then((value) {
              logsUrl = '$backendUrl/$value';
            });

          });
        });
      });
  }
}