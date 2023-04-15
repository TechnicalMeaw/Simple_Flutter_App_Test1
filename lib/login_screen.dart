import 'package:flutter/material.dart';
import 'package:simple_app/main.dart';
import 'package:simple_app/second_screen.dart';
import 'package:simple_app/utils/StorageUtil.dart';
import 'package:simple_app/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  String email = "";
  String password = "";


  void getValues(){
    StorageUtil.getInstance().getEmail().then((value) => email = value);
    StorageUtil.getInstance().getPassword().then((value) => password = value);
  }


  @override
  void initState() {
    setState(() {
      getValues();
    });
    super.initState();
  }


  final GlobalKey<FormState> _emailKey = GlobalKey();
  final GlobalKey<FormState> _passwordKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // email regex
  final validEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void logIn(){
    final isEmailOk = _emailKey.currentState?.validate();
    final isPasswordOk = _passwordKey.currentState?.validate();

    if (isEmailOk != null && isEmailOk == true && isPasswordOk != null && isPasswordOk == true){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const SecondScreen()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(10),
              child: Column(
                  children: [
                    const Text("Log In", textScaleFactor: 2,),
                    const SizedBox(height: 50,),

                    Form(key: _emailKey,
                        child: TextFormField(controller: emailController,
                          decoration: const InputDecoration(hintText: "email"),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Empty email";
                            } else if (!validEmail.hasMatch(value)) {
                              return "Invalid email id";
                            }else if(email != value.trim()){
                              return "Invalid username";
                            }
                            return null;
                          }
                        ),)
                    ),
                    Form(
                      key: _passwordKey,
                      child: TextFormField(controller: passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(hintText: "password", ),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return "Empty password";
                          } else if(password != value){
                            return "Invalid password";
                          }
                          return null;
                        },),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      logIn();
                    }, child: const Text("Log In")),
                    const SizedBox(height: 20,),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen(title: "Sign Up")));
                    }, child: const Text("New user? Sign up")),

                  ]),

            ),
          ),
        ),
      ),
    );
  }
}
