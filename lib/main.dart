import 'package:flutter/material.dart';
import 'presentation/routes/page_routes.dart';
import 'presentation/screens/employee_screen/employee_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppPage.pages,
      home: const EmployeeScreen(),
    );
  }
}
