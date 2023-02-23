import 'package:flutter/material.dart';
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
                    buttonColor: Colors.blue,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: SizedBox(
                            width: 600,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Name: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        'Department: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Time: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Token: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Fee: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Doctor ID: ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CustomButton(
                                      elevation: 6,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      label: 'Save',
                                      buttonColor: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
