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
                    onPressed: () {},
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
