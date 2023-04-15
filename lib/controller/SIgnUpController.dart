import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_app/second_screen.dart';

import '../utils/StorageUtil.dart';

class SignUpController extends GetxController{

  final RxString nameValidator = "".obs ;
  final RxString emailValidator = "".obs ;
  final RxString passwordValidator = "".obs ;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// alphanumeric validator
  final _validCharacters = RegExp(r'^[a-zA-Z0-9]+$');


  @override
  void onInit() {
    super.onInit();
    _validator();
  }

  _validator(){
  /// name validator
    nameController.addListener(() {
      if (nameController.text.trim().isEmpty){
        nameValidator.value = "Empty name";
      }else{
        nameValidator.value = "";
      }
    });
  /// email validator
    emailController.addListener(() {

      if(emailController.text.trim().isEmpty){
        emailValidator.value = "Empty email" ;
      }
      else if(!GetUtils.isEmail(emailController.text.trim())){
        emailValidator.value = "Please enter valid email" ;
      }
      else {
        emailValidator.value ="" ;
      }
    });
  /// password
    passwordController.addListener(() {
      if (passwordController.text.trim().isEmpty){
        passwordValidator.value = "Empty password";
      }else if (!_validCharacters.hasMatch(passwordController.text)){
        passwordValidator.value = "Password can only contain alphanumeric characters";
      }else if(passwordController.text.trim().length < 8){
        passwordValidator.value = "Password must be at least 8 characters";
      }else{
        passwordValidator.value = "";
      }
    });
  }


  bool signUp(){
    if (nameController.text.trim().isNotEmpty && emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty
    && nameValidator.value == "" && emailValidator.value == "" && passwordValidator.value == ""){
      return true;
    }
    return false;
  }



}