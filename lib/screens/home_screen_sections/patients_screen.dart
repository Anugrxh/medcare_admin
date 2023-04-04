import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/patient/add_patient_dialog.dart';
import 'package:medcare_admin/widgets/patient/patient_card.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_search.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
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
                      onSearch: (value) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const AddPatientDialog(),
                      );
                    },
                    label: 'Add Patient',
                    icon: Icons.add,
                    iconColor: Colors.white,
                    labelColor: Colors.white,
                    buttonColor: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    PatientCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
