import 'package:flutter/material.dart';
import 'package:simple_app/utils/StorageUtil.dart';

class SecondScreen extends StatefulWidget {

  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  ValueNotifier<String> name = ValueNotifier("");
  ValueNotifier<String> email = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");

  void getValues() async{
    StorageUtil.getInstance().getName().then((value) => name.value = value);
    StorageUtil.getInstance().getEmail().then((value) => email.value = value);
    StorageUtil.getInstance().getPassword().then((value) => password.value = value);
  }

  @override
  void initState() {
    getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(valueListenable: name, builder: (BuildContext context, value, Widget? child){
              return Text("Name: $value");
            }),
            const SizedBox(height: 10,),
            ValueListenableBuilder(valueListenable: email, builder: (BuildContext context, value, Widget? child){
              return Text("Email: $value");
            }),
            const SizedBox(height: 10,),
            ValueListenableBuilder(valueListenable: password, builder: (BuildContext context, value, Widget? child){
              return Text("Password: $value");
            })
          ],
        ),
      ),
    );
  }
}
