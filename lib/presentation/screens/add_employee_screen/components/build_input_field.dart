import 'package:flutter/material.dart';

class BuildInputField extends StatelessWidget {
  const BuildInputField(
      {super.key, required this.size, required this.label, required this.icon});

  final Size size;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIconConstraints:
                const BoxConstraints(minWidth: 23, maxHeight: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                icon,
              ),
            ),
            labelText: label),
      ),
    );
  }
}
