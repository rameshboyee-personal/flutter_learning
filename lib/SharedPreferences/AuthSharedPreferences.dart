
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthKey.dart';
class AuthSharedPreferences  {

  Future<void> putString(AuthKey key, var value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key.name, value);
  }

  Future<String?> getString(AuthKey key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key.name);
  }

  Future<void> putBool(AuthKey key, var value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key.name, value);
  }

  Future<bool?> getBool(AuthKey key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key.name);
  }


}







