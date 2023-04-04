import 'package:flutter/material.dart';

import '../custom_action_button.dart';
import '../custom_card.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SizedBox(
        width: 312.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#432342',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Patient Name',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(
                height: 20,
                endIndent: 150,
              ),
              Text(
                '23 Female',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(
                height: 20,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'patient@medcare.com',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(
                height: 20,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '9871234124',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(
                height: 20,
                color: Color.fromARGB(66, 176, 176, 176),
              ),
              CustomActionButton(
                iconData: Icons.arrow_outward,
                onPressed: () {},
                label: 'Patient Details',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
