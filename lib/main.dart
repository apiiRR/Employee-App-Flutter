import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/routes/page_routes.dart';
import 'presentation/screens/employee_screen/employee_screen.dart';
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
        builder: (context, child) => Consumer<AuthViewModel>(
              builder: (context, auth, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Employee App',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                routes: AppPage.pages,
                home: auth.isAuth
                    ? const EmployeeScreen()
                    : FutureBuilder(
                        future: auth.autoLogin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          return const LoginScreen();
                        }),
              ),
            ));
  }
}
