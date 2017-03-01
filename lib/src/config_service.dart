import 'dart:async';
import 'package:angular2/core.dart';
import 'package:yaml/yaml.dart';
import 'dart:convert';
import 'package:resource/resource.dart' show Resource;

@Injectable()
class ConfigService {

  YamlMap _config = null;
  bool _initialized = false;

  ConfigService() {
  }

  Future _init() async {
    var resource = new Resource("config.yaml");
    var doc = await resource.readAsString(encoding: UTF8);
    _config = loadYaml(doc);
    _initialized = true;
  }

  Future<T> Get<T>(String name, T default_value) async {
    if (!_initialized)
      await _init();

    if (_config == null)
      return default_value;

    var value = _config[name];

    if (value == null)
      return default_value;

    return value as T;
  }

  Future<Map<String, String>> GetAll() async {
    Map<String, String> result = new Map<String, String>();

    if (!_initialized)
      await _init();

    if (_config == null)
      return result;

    _config.forEach((key, value) {
      result[key.toString()] = value.toString();
    });

    return result;
  }

}
