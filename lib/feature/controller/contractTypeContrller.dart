

import 'package:get/get.dart';


class ContractTypeController extends GetxController{


var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }
}
class ServiceTimeController extends GetxController{

  List ServiceTimelist = ["8","10","12"];
  var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }
}

class NeedCareController extends GetxController{

  var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }

}


class TypeCareController extends GetxController{

  var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }
}