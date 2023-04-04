import 'package:flutter/material.dart';
import 'package:medcare_admin/screens/home_screen_sections/patients_screen.dart';

import 'package:medcare_admin/screens/login.dart';
import 'package:medcare_admin/widgets/drawer_button.dart';
import 'package:medcare_admin/widgets/custom_button.dart';

import 'home_screen_sections/appoinment_screen.dart';
import 'home_screen_sections/dashbord.dart';
import 'home_screen_sections/desk_screen.dart';
import 'home_screen_sections/doctor_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      initialIndex: 4,
      vsync: this,
    );
    super.initState();
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Doctors';
      case 2:
        return 'Desk';
      case 3:
        return 'Appointments';
      case 4:
        return 'Patients';

      default:
        return 'Dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTitle(_tabController?.index ?? 0),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardScreen(),
          DoctorScreen(),
          DeskScreen(),
          AppointmentScreen(),
          PatientsScreen(),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'MENU',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerButton(
                iconData: Icons.dashboard_outlined,
                label: 'DASHBOARD',
                onPressed: () {
                  _tabController!.animateTo(0);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 0,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                iconData: Icons.person_outline,
                label: 'DOCTORS',
                onPressed: () {
                  _tabController!.animateTo(1);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 1,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                iconData: Icons.desk_outlined,
                label: 'DESK',
                onPressed: () {
                  _tabController!.animateTo(2);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 2,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                iconData: Icons.receipt_outlined,
                label: 'APPOINTMENTS',
                onPressed: () {
                  _tabController!.animateTo(3);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 3,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                iconData: Icons.person_3_outlined,
                label: 'PATIENTS',
                onPressed: () {
                  _tabController!.animateTo(4);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 4,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerButton(
                iconData: Icons.logout_outlined,
                label: 'LOGOUT',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Are you sure you want to logout ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomButton(
                                  label: 'Cancel',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomButton(
                                  label: 'Logout',
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  buttonColor: Colors.blue,
                                  labelColor: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
