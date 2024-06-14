abstract class LocalDataFavor {

    Future<List<String>> getfavorceps({required String key});
    void setfavorceps({required String key,required List<String> myfavorceps});
    void setforkeysdb({required String key,required String myfavorceps});
    Future<Map<String,dynamic>> getforkeysdb({required String key});

}