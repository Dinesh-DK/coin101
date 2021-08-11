import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  static SharedPreferences? _prefs;

  static SharedPreferences get  prefs {
    if(_prefs == null) {
      initialize();
    }

    return _prefs!;
  }
  static initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
}