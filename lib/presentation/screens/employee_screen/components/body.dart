import 'package:flutter/material.dart';

import '../../../routes/route_names.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.detailEmployeeScreen);
              },
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("R"),
              ),
              title: Text("Rafi Ramadhana"),
              subtitle: Text("(999) 999 999 999"),
            ));
  }
}
