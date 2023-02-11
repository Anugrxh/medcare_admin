import 'package:flutter/material.dart';
import 'package:medcare_admin/widgets/dashcard.dart';

import '../widgets/custom_search.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1000,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomSearch(),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                DashCard(),
                SizedBox(
                  width: 80,
                ),
                DashCard(),
                SizedBox(
                  width: 80,
                ),
                DashCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
