import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medcare_admin/widgets/appointment_card.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_search.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
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
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
              SizedBox(
                height: 20,
              ),
              AppoinmentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
