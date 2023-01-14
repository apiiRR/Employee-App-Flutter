import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'build_input_field.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.formKey});
  final Key formKey;

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
              backgroundColor: Colors.purple,
              radius: 64,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 48,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  BuildInputField(
                    size: size,
                    label: "Email",
                    icon: Icons.email,
                    name: "email",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildInputField(
                    size: size,
                    label: "First Name",
                    icon: Icons.person,
                    name: "first_name",
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildInputField(
                    size: size,
                    label: "Last Name",
                    icon: Icons.person,
                    name: "last_name",
                    validator: FormBuilderValidators.required(),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
