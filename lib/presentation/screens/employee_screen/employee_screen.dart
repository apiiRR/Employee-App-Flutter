import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/route_names.dart';
import '../../view_model/auth_view_model.dart';
import 'components/body.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthViewModel>(context, listen: false).logOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.loginScreen, (route) => false);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
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
