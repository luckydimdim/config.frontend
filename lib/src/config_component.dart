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

    bool prod = await _config.Get<bool>("production", false);

    print(prod);
  }

}