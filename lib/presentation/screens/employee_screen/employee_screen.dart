import 'package:flutter/material.dart';

import '../../routes/route_names.dart';
import 'components/body.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
      ),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.addEmployeeScreen);
              },
              icon: const Icon(Icons.add))),
    );
  }
}
