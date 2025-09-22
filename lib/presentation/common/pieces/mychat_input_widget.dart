import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.label,
    required this.hint,
    this.labelStyle,
    this.bgColor,
    this.leading,
    this.trailing,
    this.isPassword = false,
    this.controller
  });

  final String label;
  final String hint;
  final TextStyle? labelStyle;
  final Color? bgColor;
  final Widget? leading; // Accepts any Widget
  final Widget? trailing; // Accepts any Widget
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    // Define default styles
    const defaultLabelStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    );
    final defaultBgColor = Colors.grey[200];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ?? defaultLabelStyle,
        ),
        const SizedBox(height: 8), 
        
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: bgColor ?? defaultBgColor,
            prefixIcon: leading, // Directly use the widget
            suffixIcon: trailing,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}