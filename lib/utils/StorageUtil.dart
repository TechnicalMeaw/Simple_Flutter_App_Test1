import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_app/utils/StringsUtil.dart';

class StorageUtil{



  static late SharedPreferences _prefs;

  StorageUtil._(){

    init();
  }

  factory StorageUtil.getInstance() => StorageUtil._();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  Future<void> saveLocally(String name, String email, String password) async {
    // Obtain shared preferences.


    // Save an String value to 'action' key.
    await _prefs.setString(StringsUtil.name, name);
    await _prefs.setString(StringsUtil.email, email);
    await _prefs.setString(StringsUtil.password, password);
  }


  Future<String> getEmail() async {


    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String? email = _prefs.getString(StringsUtil.email);

    return email?? "";
  }

  Future<String> getName() async {


    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String? name = _prefs.getString(StringsUtil.name);

    return name?? "";
  }

  Future<String> getPassword() async {

    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String? password = _prefs.getString(StringsUtil.password);

    return password?? "";
  }
}