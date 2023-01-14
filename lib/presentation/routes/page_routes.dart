import '../screens/add_employee_screen/add_employe_screen.dart';
import '../screens/detail_employee_screen/detail_employee_screen.dart';
import '../screens/employee_screen/employee_screen.dart';
import 'route_names.dart';

class AppPage {
  static final pages = {
    RouteNames.employeeScreen: (context) => const EmployeeScreen(),
    RouteNames.addEmployeeScreen: (context) => const AddEmployeeScreen(),
    RouteNames.detailEmployeeScreen: (context) => const DetailEmployeeScreen()
  };
}
