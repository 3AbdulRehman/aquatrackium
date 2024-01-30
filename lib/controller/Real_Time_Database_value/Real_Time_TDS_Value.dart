


import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
class TDSVAlue extends GetxController{
  final _database = FirebaseDatabase.instance.ref('esp');
  var value = "Loading".obs;

  void tdsValue(){
    _database.child('tds').onValue.listen((event) {
      final data = event.snapshot.value;
      if(data!= null){
        value.value = data.toString();
      }else{
        value.value = 'TDS Value Not Found';
      }
    });
  }

}