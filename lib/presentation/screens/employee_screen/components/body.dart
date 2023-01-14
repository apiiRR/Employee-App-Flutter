import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/route_names.dart';
import '../../../view_model/employee_view_model.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<EmployeeViewModel>(context, listen: false).getDatas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final EmployeeViewModel employeeViewModel =
        Provider.of<EmployeeViewModel>(context);
    final isLoading = employeeViewModel.state == EmployeeViewState.loading;
    final isError = employeeViewModel.state == EmployeeViewState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      );
    }

    if (isError) {}

    if (employeeViewModel.datas != null &&
        employeeViewModel.datas!.isNotEmpty) {
      return ListView.builder(
          itemCount: employeeViewModel.datas!.length,
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  employeeViewModel.detailData =
                      employeeViewModel.datas![index];
                  Navigator.pushNamed(context, RouteNames.detailEmployeeScreen);
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    employeeViewModel.datas![index].firstName[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                    "${employeeViewModel.datas![index].firstName} ${employeeViewModel.datas![index].lastName}"),
                subtitle: Text(employeeViewModel.datas![index].email),
              ));
    } else {
      return Container();
    }
  }
}
