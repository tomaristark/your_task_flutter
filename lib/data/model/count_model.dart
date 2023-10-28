import 'package:your_task_flutter/persistent/dao/count_dao.dart';

class CountModel{
  CountModel._();

  static final CountModel _singleton = CountModel._();

  factory CountModel()=>_singleton;

  final CountDAO _countDAO = CountDAO();

  void saveCountValue (int countValue){
    _countDAO.saveCountValue(countValue);
  }

  int getCountValue(){
   return  _countDAO.getCountValue ?? 0;
  }
}