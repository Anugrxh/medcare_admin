import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medcare_admin/widgets/custom_search.dart';

import '../widgets/custom_button.dart';
import '../widgets/doctor_card.dart';

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
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(flex: 10, child: CustomSearch()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CustomButton(
                    label: "ADD",
                    onPressed: () {},
                    elevation: 5,
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    DoctorCard(),
                    SizedBox(
                      height: 20,
                    ),
                    DoctorCard(),
                    SizedBox(
                      height: 20,
                    ),
                    DoctorCard(),
                    SizedBox(
                      height: 20,
                    ),
                    DoctorCard(),
                    SizedBox(
                      height: 20,
                    ),
                    DoctorCard(),
                    SizedBox(
                      height: 20,
                    ),
                    DoctorCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
