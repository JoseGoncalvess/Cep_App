
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'local_data_favor.dart';

class LocalDataFavorImp implements LocalDataFavor {
  @override
  Future<List<String>> getfavorceps({required String key})async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getStringList(key)?? [];
  }
  
  @override
  void setfavorceps({required String key, required List<String> myfavorceps})async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList(key, myfavorceps);
  }
  
  @override
  void setforkeysdb({required String key, required String myfavorceps}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, myfavorceps);
   
  }
  
  @override
  Future<Map<String, dynamic>> getforkeysdb({required String key})async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String response = prefs.getString(key) ?? '';
   return response.isEmpty?{}: jsonDecode(response);
  }
  



  
}