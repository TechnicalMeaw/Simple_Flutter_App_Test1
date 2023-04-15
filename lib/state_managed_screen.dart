import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/Controller.dart';

class StateManagedScreen extends StatelessWidget {
   StateManagedScreen({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Simple State"),
        centerTitle: true,
        leading:IconButton(onPressed:  Get.back, icon: const Icon( Icons.arrow_back)) ,
       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text("${controller.count}" , style: const TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500 ),)),
            ElevatedButton(onPressed: () => controller.increment(), child: const Text("Increment"))
          ],
        ),
      ),
    );
  }
}
