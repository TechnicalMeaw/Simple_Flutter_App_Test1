import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String warningText;

  const InputField({Key? key, required this.controller, required this.hintText, required this.warningText}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputField(inputController: widget.controller, hint: widget.hintText),
        const SizedBox(height: 5.0),
        if(widget.warningText != "") _validator(widget.warningText)
      ],
    );
  }
}


Widget _inputField({required TextEditingController inputController, required String hint}){
  return TextFormField(controller: inputController, decoration: InputDecoration(hintText: hint),);
}

Widget _validator(String text){
  return Text(text, style: const TextStyle(color: Colors.red));
}



