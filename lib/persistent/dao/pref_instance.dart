import 'package:shared_preferences/shared_preferences.dart';

class PrefInstance{
  static late SharedPreferences _sharedPreferences;

  static SharedPreferences get getSharePreferences => _sharedPreferences;

  static Future<void> createSharePrefrenceInstance() async{
    _sharedPreferences= await SharedPreferences.getInstance();
    return Future.value();
  }
}