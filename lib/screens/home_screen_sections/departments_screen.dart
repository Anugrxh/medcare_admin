import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_admin/blocs/patients/manage_patients/manage_patients_bloc.dart';
import 'package:medcare_admin/widgets/custom_action_button.dart';
import 'package:medcare_admin/widgets/custom_card.dart';
import 'package:medcare_admin/widgets/patient/add_patient_dialog.dart';
import 'package:medcare_admin/widgets/patient/patient_card.dart';

import '../../blocs/department_bloc/department_bloc.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_search.dart';
import '../../widgets/department/add_edit_department_dialog.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({super.key});

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {
  DepartmentBloc manageDepartmentsBloc = DepartmentBloc();

  @override
  void initState() {
    super.initState();
    manageDepartmentsBloc.add(GetAllDepartmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepartmentBloc>.value(
      value: manageDepartmentsBloc,
      child: BlocConsumer<DepartmentBloc, DepartmentState>(
        listener: (context, state) {
          if (state is DepartmentFailureState) {
            //show dialog
          }
        },
        builder: (context, state) {
          return Center(
            child: SizedBox(
              width: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomSearch(
                            onSearch: (value) {
                              manageDepartmentsBloc.add(
                                GetAllDepartmentsEvent(
                                  query: value,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  BlocProvider<DepartmentBloc>.value(
                                value: manageDepartmentsBloc,
                                child: const AddEditDepartmentDialog(),
                              ),
                            );
                          },
                          label: 'Add Department',
                          icon: Icons.add,
                          iconColor: Colors.white,
                          labelColor: Colors.white,
                          buttonColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  state is DepartmentLoadingState
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 1,
                            child: LinearProgressIndicator(),
                          ),
                        )
                      : const Divider(
                          height: 1,
                          endIndent: 20,
                          indent: 20,
                        ),
                  Expanded(
                    child: state is DepartmentSuccessState
                        ? state.departments.isNotEmpty
                            ? ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 10,
                                ),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        DepartmentCard(
                                  departmentDetails: state.departments[index],
                                  departmentBloc: manageDepartmentsBloc,
                                ),
                                itemCount: state.departments.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(height: 15),
                              )
                            : const Center(child: Text('No Departments Found!'))
                        : state is DepartmentFailureState
                            ? Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomActionButton(
                                      iconData: Icons.replay_outlined,
                                      onPressed: () {
                                        manageDepartmentsBloc
                                            .add(GetAllDepartmentsEvent());
                                      },
                                      label: 'Retry',
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DepartmentCard extends StatelessWidget {
  final Map<String, dynamic> departmentDetails;
  final DepartmentBloc departmentBloc;
  const DepartmentCard({
    super.key,
    required this.departmentDetails,
    required this.departmentBloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${departmentDetails['id']}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    departmentDetails['name'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider<DepartmentBloc>.value(
                    value: departmentBloc,
                    child: AddEditDepartmentDialog(
                      departmentData: departmentDetails,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomAlertDialog(
                    title: 'Are you sure?',
                    message:
                        'Are you sure you want to delet this department? any data associated with this department will be deleted as well',
                    primaryButtonLabel: 'Delete',
                    primaryOnPressed: () {
                      departmentBloc.add(
                        DeleteDepartmentsEvent(
                          id: departmentDetails['id'],
                        ),
                      );
                      Navigator.pop(context);
                    },
                    secondaryButtonLabel: 'Cancel',
                  ),
                );
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
