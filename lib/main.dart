import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/routes/page_routes.dart';
import 'presentation/screens/login_screen/login_screen.dart';
import 'presentation/view_model/auth_view_model.dart';
import 'presentation/view_model/employee_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => EmployeeViewModel()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppPage.pages,
        home: const LoginScreen(),
      ),
    );
  }
}
