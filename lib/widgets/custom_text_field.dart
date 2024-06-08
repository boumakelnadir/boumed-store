import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.iconData,
    this.onChanged,
    this.keyboardType,
    this.mycontroller,
  });
  final String? hintText;
  final IconData? iconData;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        enableInteractiveSelection: true,
        keyboardType: widget.keyboardType,
        controller: widget.mycontroller,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: widget.hintText,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          hintText: widget.hintText,
          suffixIcon: Icon(widget.iconData),
        ),
      ),
    );
  }
}
