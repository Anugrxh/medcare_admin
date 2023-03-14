import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_search.dart';
import '../widgets/desk_card.dart';

class DeskScreen extends StatefulWidget {
  const DeskScreen({super.key});

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

class _DeskScreenState extends State<DeskScreen> {
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
                                        'Gmail: ',
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
                                        'phone: ',
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
                                        buttonColor: Colors.blue),
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
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
              SizedBox(
                height: 20,
              ),
              DeskCard(),
            ],
          ),
        ),
      ),
    );
  }
}
