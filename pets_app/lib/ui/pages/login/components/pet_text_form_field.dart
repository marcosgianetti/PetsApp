import 'package:flutter/material.dart';

class PetTextFormField extends StatelessWidget {
  const PetTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.black,
            decorationColor: Colors.black,
          ),
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: _borderColor(),
            disabledBorder: _borderColor(),
            errorText: errorText,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            labelText: hintText,
            labelStyle: const TextStyle(color: Colors.grey),
          ),
        ));
  }
}

_borderColor({Color color = Colors.grey}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
