import 'package:get/get.dart';
import 'package:simple_app/utils/StorageUtil.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() async {
   StorageUtil.getInstance() ;
  }


}