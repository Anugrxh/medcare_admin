import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_admin/blocs/desk/desk_bloc.dart';
import 'package:medcare_admin/widgets/custom_search.dart';

import '../../widgets/custom_action_button.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/desk/add_edit_desk_dialog.dart';
import '../../widgets/desk/desk_card.dart';

class DeskScreen extends StatefulWidget {
  const DeskScreen({super.key});

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

class _DeskScreenState extends State<DeskScreen> {
  final DeskBloc deskBloc = DeskBloc();

  @override
  void initState() {
    deskBloc.add(GetAllDeskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          child: BlocProvider<DeskBloc>.value(
            value: deskBloc,
            child: BlocConsumer<DeskBloc, DeskState>(
              listener: (context, state) {
                if (state is DeskFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failure',
                      message: state.message,
                      primaryButtonLabel: 'Ok',
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomSearch(
                              onSearch: (value) {
                                deskBloc.add(GetAllDeskEvent(query: value));
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomCard(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => BlocProvider<DeskBloc>.value(
                                  value: deskBloc,
                                  child: const AddEditDeskDialog(),
                                ),
                              );
                            },
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 15,
                                left: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Add Desk User',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    state is DeskLoadingState
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 1,
                              child: LinearProgressIndicator(),
                            ),
                          )
                        : const Divider(
                            height: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                    Expanded(
                      child: state is DeskSuccessState
                          ? state.desks.isNotEmpty
                              ? SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                  child: Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    alignment: WrapAlignment.start,
                                    children: List<Widget>.generate(
                                      state.desks.length,
                                      (index) => DeskCard(
                                        deskBloc: deskBloc,
                                        deskDetails: state.desks[index],
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text('No Desk Users Found!'))
                          : state is DeskFailureState
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomActionButton(
                                        iconData: Icons.replay_outlined,
                                        onPressed: () {
                                          deskBloc.add(GetAllDeskEvent());
                                        },
                                        label: 'Retry',
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
