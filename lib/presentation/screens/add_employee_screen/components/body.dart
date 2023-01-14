import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'build_input_field.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Center(
            child: CircleAvatar(
              radius: 64,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 48,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  BuildInputField(
                    size: size,
                    label: "Email",
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildInputField(
                    size: size,
                    label: "First Name",
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildInputField(
                    size: size,
                    label: "Last Name",
                    icon: Icons.person,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
