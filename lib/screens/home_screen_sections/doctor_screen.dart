import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/custom_button.dart';
import 'package:medcare_admin/widgets/custom_search.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/department_selector.dart';
import '../../widgets/doctor/add_doctor_dialog.dart';
import '../../widgets/doctor/doctor_card.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearch(
                        onSearch: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const DepartmentSelector(),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const AddDoctorDialog(),
                        );
                      },
                      label: 'Add Doctor',
                      icon: Icons.add,
                      iconColor: Colors.white,
                      labelColor: Colors.white,
                      buttonColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
                endIndent: 20,
                indent: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: const [
                      DoctorCard(),
                      DoctorCard(),
                      DoctorCard(),
                      DoctorCard(),
                      DoctorCard(),
                      DoctorCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
