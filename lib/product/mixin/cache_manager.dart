import 'package:vbt_camp_widget/core/init/locale/locale_manager.dart';
import 'package:vexana/vexana.dart';

mixin CacheManager {
  Future<void> saveData(PreferencesKey key, INetworkModel model) async {
    await LocaleManager.instance.setDynamicJson(key, model);
  }

  Future<T> getData<T extends INetworkModel>(PreferencesKey key, T model) async {
    return LocaleManager.instance.getDynamicValue<T>(key, model);
  }

  Future<void> clearWithoutFirstLogin() async {
    await LocaleManager.instance.clearWithoutFirstLogin();
  }

  Future<void> saveStringData(PreferencesKey key, String string) async {
    await LocaleManager.instance.setStringValue(key, string);
  }

  void getStringData(PreferencesKey key) {
    LocaleManager.instance.getStringValue(key);
  }

  Future<void> saveListData(PreferencesKey key, List<String> list) async {
    await LocaleManager.instance.setListValue(key, list);
  }

  Future<void> saveIntData(PreferencesKey key, int value) async {
    await LocaleManager.instance.setIntValue(key, value);
  }

  void getIntData(PreferencesKey key) {
    LocaleManager.instance.getIntValue(key);
  }
}
