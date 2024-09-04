import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  const MyField({
    super.key,
    required this.lable,
    required this.maxlines, this.onSaved, this.onchange, this.hint
  });
  final String lable;
  final int maxlines;

  final void Function(String?)? onchange;
  final String ?hint;
  

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onchange ,

      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        }
        return null;
      },
      maxLines: maxlines,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: lable,
        hintText:  hint?? "",
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color.fromARGB(255, 10, 7, 7))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color.fromARGB(255, 24, 0, 23))),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
