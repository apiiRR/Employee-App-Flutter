import 'package:flutter/material.dart';
import 'components/body.dart';

class DetailEmployeeScreen extends StatelessWidget {
  const DetailEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: const Body(),
    );
  }
}
