import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuildInputField extends StatelessWidget {
  const BuildInputField(
      {super.key,
      required this.name,
      required this.size,
      required this.label,
      required this.icon,
      required this.validator});

  final String name;
  final Size size;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: Colors.purple)),
        child: FormBuilderTextField(
          validator: validator,
          name: name,
          decoration: InputDecoration(
            prefixIconConstraints:
                const BoxConstraints(minWidth: 23, maxHeight: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                icon,
              ),
            ),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
