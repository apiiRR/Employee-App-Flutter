import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/auth_model.dart';
import '../../../routes/route_names.dart';
import '../../../view_model/auth_view_model.dart';
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
            height: 48,
          ),
          Center(
            child: SizedBox(
                width: size.width * 0.7,
                child: Image.asset("assets/images/logo_transisi_black.png")),
          ),
          const SizedBox(
            height: 48,
          ),
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  BuildInputField(
                      size: size,
                      title: "Email",
                      name: "email",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ])),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildInputField(
                    size: size,
                    title: "Password",
                    name: "password",
                    validator: FormBuilderValidators.required(),
                    isPassword: true,
                  )
                ],
              )),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            width: size.width,
            child: Consumer<AuthViewModel>(
              builder: (context, auth, child) => ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final AuthModel data = AuthModel(
                        email: _formKey.currentState!.value["email"],
                        password: _formKey.currentState!.value["password"]);

                    auth.login(data).then((value) {
                      if (auth.isAuth) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RouteNames.employeeScreen, (route) => false);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Text("Login"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
