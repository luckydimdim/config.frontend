import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:yaml/yaml.dart';
import 'package:resource/resource.dart' show Resource;

import 'config_helper.dart';

@Injectable()
class ConfigService {
  YamlMap _config = null;
  bool _initialized = false;

  ConfigHelper helper;

  ConfigService() {
    bool isDebug = (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) != 'true';

    helper = new ConfigHelper(isDebug);
  }

  Future _init() async {
    var resource = new Resource('config.yaml');
    var doc = await resource.readAsString(encoding: UTF8);
    _config = loadYaml(doc);
    _initialized = true;
  }

  /**
   * Возвращает значение из конфига по ключу
   */
  Future<T> Get<T>(String name, [T defaultValue]) async {
    if (!_initialized)
      await _init();

    if (_config == null)
      return getDefaultValue(name, defaultValue);

    var value = _config[name];

    if (value == null)
      return getDefaultValue(name, defaultValue);

    return value as T;
  }

  /**
   * Возвращает либо значение по умолчанию, либо кидает исключение
   */
  T getDefaultValue<T>(String name, T value) {
    if (value == null)
      throw new ArgumentError('Neither value nor default value set for $name.');

    return value;
  }

  /**
   * Возвращает все значения из конфига
   */
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