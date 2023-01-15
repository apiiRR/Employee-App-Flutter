import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import '../../../data/model/employee_model.dart';
import '../../view_model/employee_view_model.dart';
import 'components/body.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Add Employee"),
          centerTitle: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          actions: [
            TextButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final EmployeeModel employee = EmployeeModel(
                        id: "0",
                        email: _formKey.currentState!.value["email"],
                        firstName: _formKey.currentState!.value["first_name"],
                        lastName: _formKey.currentState!.value["last_name"]);

                    Provider.of<EmployeeViewModel>(context, listen: false)
                        .addData(employee)
                        .then((value) => Navigator.pop(context));
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: Body(
          formKey: _formKey,
        ));
  }
}
