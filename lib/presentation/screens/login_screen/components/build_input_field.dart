import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuildInputField extends StatefulWidget {
  const BuildInputField(
      {super.key,
      required this.size,
      required this.title,
      required this.name,
      required this.validator,
      this.isPassword = false});

  final Size size;
  final String title;
  final String name;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(
            height: 8,
          ),
          Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    ThemeData().colorScheme.copyWith(primary: Colors.purple)),
            child: FormBuilderTextField(
              obscureText: widget.isPassword == true
                  ? (isVisibility == false ? true : false)
                  : false,
              validator: widget.validator,
              name: widget.name,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  suffixIcon: widget.isPassword == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisibility = !isVisibility;
                            });
                          },
                          icon: Icon(isVisibility == false
                              ? Icons.visibility
                              : Icons.visibility_off))
                      : null),
            ),
          )
        ],
      ),
    );
  }
}