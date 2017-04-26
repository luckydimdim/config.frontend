import 'dart:async';
import 'package:angular2/core.dart';
import 'config_service.dart';

@Component(
    selector: 'config',
    templateUrl: 'config_component.html')
class ConfigComponent implements OnInit {
  final ConfigService _config;
  Map<String,String> values = new Map<String, String>();

  ConfigComponent(this._config);

  @override
  Future ngOnInit() async {
    values = await _config.GetAll();

    bool prod = await _config.Get<bool>('production', false);
    String port = await _config.Get<String>('backend_port');
    String logsUrl = _config.helper.logsUrl;
    String backendUrl = _config.helper.backendUrl;
    String authUrl = _config.helper.authUrl;

    print('production: $prod');
    print('port: $port');
    print('backendUrl: $backendUrl');
    print('logsUrl: $logsUrl');
    print('authUrl: $authUrl');
  }
}