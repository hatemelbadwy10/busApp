import 'package:flutter/material.dart';
import 'package:busapp/core/utils/styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.obscureText,
    required this.hint,
    this.onTap,
    this.icon,
    this.readOnly = false,
    this.textEditingController,
    this.validator, // Add validator property
  });

  final bool? obscureText;
  final String hint;
  final void Function()? onTap;
  final IconData? icon;
  final bool readOnly;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator; // Validator function

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    );

    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText ?? false,
      readOnly: readOnly, // Set the text field to read-only
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: icon != null
            ? GestureDetector(
          onTap: onTap,
          child: Icon(icon),
        )
            : null,
        hintStyle: Styles.textStyle12,
        border: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle.copyWith(
          borderSide: BorderSide(width: 1, color: Colors.grey.shade900),
        ),
      ),
      onTap: onTap, // Use onTap to handle the tap event
      validator: validator, // Use validator
    );
  }
}
