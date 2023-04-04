import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/custom_action_button.dart';
import 'package:medcare_admin/widgets/patient/patient_appointment_card.dart';

import '../widgets/token_card.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: Text(
          'Patient Details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '#23423123',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Patient Name',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '23 Male',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'patient@gmail.com',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '9877123123',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 40,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              const Text(
                'Appointment History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 15,
                ),
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
                      PatientAppointmentCard(),
                      PatientAppointmentCard(),
                      PatientAppointmentCard(),
                      PatientAppointmentCard(),
                      PatientAppointmentCard(),
                      PatientAppointmentCard(),
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
