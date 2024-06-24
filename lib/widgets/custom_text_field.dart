import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.keyboardType,
    this.mycontroller,
    this.showIcon = false,
  });
  final String? hintText;
  final bool showIcon;

  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visibilityIcon = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: (value) {
          if (value == '') {
            return 'field required ${widget.hintText}';
          } else {
            return null;
          }
        },
        obscureText: widget.showIcon ? !visibilityIcon : false,
        obscuringCharacter: '*',
        cursorColor: Colors.white,
        enableInteractiveSelection: true,
        keyboardType: widget.keyboardType,
        controller: widget.mycontroller,
        style: const TextStyle(fontSize: 18, color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          hintText: widget.hintText,
          suffixIcon: widget.showIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      visibilityIcon = !visibilityIcon;
                    });
                  },
                  icon: Icon(
                    visibilityIcon ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
