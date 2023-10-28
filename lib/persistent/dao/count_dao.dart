import 'package:your_task_flutter/persistent/dao/pref_instance.dart';
import 'package:your_task_flutter/persistent/prefrence_constant.dart';

class CountDAO{
  CountDAO._();

  static final CountDAO _singleton = CountDAO._();

  factory CountDAO()=>_singleton;

  void saveCountValue(int countValue){
    PrefInstance.getSharePreferences.setInt(kCounterKey, countValue);
  }

  int ?get getCountValue=>PrefInstance.getSharePreferences.getInt(kCounterKey);
}