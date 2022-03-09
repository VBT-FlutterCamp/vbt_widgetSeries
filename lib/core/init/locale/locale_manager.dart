import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexana/vexana.dart';

class LocaleManager {
  static final LocaleManager _instace = LocaleManager._init();
  SharedPreferences? _preferences;
  static LocaleManager get instance => _instace;
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<bool> clearWithoutFirstLogin() async {
    await _preferences?.clear();
    await setBoolValue(PreferencesKey.firstLoginApp, false);
    return true;
  }

  Future<bool> clear() async {
    return await _preferences!.clear();
  }

  Future<void> setStringValue(PreferencesKey key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setIntValue(PreferencesKey key, int value) async {
    await _preferences?.setInt(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKey key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  Future<void> setListValue(PreferencesKey key, List<String> value) async {
    await _preferences?.setStringList(key.toString(), value);
  }

  Future<void> setDynamicJson<T>(PreferencesKey key, T model) async {
    await _preferences?.setString(key.toString(), jsonEncode(model));
  }

  T getDynamicValue<T extends INetworkModel>(PreferencesKey key, T model) {
    final body = getStringValue(key);
    if (body.isNotEmpty) {
      return model.fromJson(jsonDecode(body));
    }
    return model;
  }

  String getStringValue(PreferencesKey key) => _preferences!.getString(key.toString()) ?? '';
  int? getIntValue(PreferencesKey key) => _preferences!.getInt(key.toString());
  bool? getBoolValue(PreferencesKey key) => _preferences!.getBool(key.toString());
}

enum PreferencesKey { token, firstLoginApp, login, user, theme, company }
