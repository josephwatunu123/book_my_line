import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Color? textColor;
  final Color? fillColor;
  final Color? focusColor;
  final String? errorText;
  final FontWeight? inputFontWeight;
  final ValueChanged<String>? onChanged;
  const CustomFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.textColor,
    this.onChanged,
    this.errorText,
    this.fillColor,
    this.focusColor,
    this.inputFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        onChanged: onChanged,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: inputFontWeight,
        ),
        decoration: InputDecoration(
          fillColor: fillColor ?? theme.primaryColor,
          focusColor: focusColor,
          labelText: labelText ?? "",
          hintText: hintText ?? "",
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelStyle: TextStyle(color: titleBlue),
          prefixIcon: prefixIcon,
          errorText: errorText,
          prefixIconColor: theme.primaryColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
