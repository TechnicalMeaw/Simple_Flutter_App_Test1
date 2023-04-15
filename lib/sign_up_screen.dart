import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_app/controller/SIgnUpController.dart';
import 'package:simple_app/widget/input_field.dart';

import 'second_screen.dart';
import 'utils/StorageUtil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.title});


  final String title;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final controller = Get.put(SignUpController());

  // alphanumeric validator
  final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');


/*  void logIn(String username, String password) {
    if (username.isEmpty) {
      _showToast(context, "Empty username");
    } else if (username.length < 10) {
      _showToast(context, "Username should not be less than 10 characters");
    } else if (password.isEmpty) {
      _showToast(context, "Empty password");
    } else if (password.length < 8) {
      _showToast(context, "Password should not be less than 8 characters");
    } else if (!validCharacters.hasMatch(password)) {
      _showToast(
          context, "Password should contain only alphanumeric characters");
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SecondScreen(username: username, password: password)));
    }
  }*/


  /*void signUp(String name, String email, String password) {
    final isNameOk = _nameKey.currentState?.validate();
    final isEmailOk = _emailKey.currentState?.validate();
    final isPasswordOk = _passwordKey.currentState?.validate();

    if (isNameOk != null && isNameOk == true && isEmailOk != null &&
        isEmailOk == true && isPasswordOk != null && isPasswordOk == true) {
      *//*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SecondScreen(username: username, password: password)));*//*

      StorageUtil.saveLocally(name, email, password).then((_) =>
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const SecondScreen())));
    }
  }*/


  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => InputField(
                  controller: controller.nameController, hintText: "name", warningText: controller.nameValidator.value))
              ,
              Obx(() => InputField(
                  controller: controller.emailController, hintText: "email", warningText: controller.emailValidator.value))
              ,
              Obx(() => InputField(
                controller: controller.passwordController, hintText: "password", warningText: controller.passwordValidator.value,))
              ,
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // logIn(usernameController.text.trim(), passwordController.text);
                    if(controller.signUp()){
                      StorageUtil.getInstance().saveLocally(controller.nameController.text.trim(), controller.emailController.text.trim(), controller.passwordController.text.trim()).then((_) =>
                          Get.to(() => const SecondScreen()));

                    }else{
                      _showToast(context, "Please enter valid details");
                    }
                  },
                  child: const Text("Sign up")),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

