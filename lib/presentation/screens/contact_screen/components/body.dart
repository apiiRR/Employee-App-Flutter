import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ListTile(
              leading: CircleAvatar(
                child: Text("R"),
              ),
              title: Text("Rafi Ramadhana"),
              subtitle: Text("(999) 999 999 999"),
            ));
  }
}
