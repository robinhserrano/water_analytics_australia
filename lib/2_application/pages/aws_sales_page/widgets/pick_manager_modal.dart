import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/bloc/users_cubit.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/injection.dart';

Future<List<int>?> showPickManager(
  BuildContext context,
  List<int> selectedId,
  int currentUserId,
  int currentUserAccessLevel,
) async {
  // // final uniqueSalesReps = record
  // //     .where(
  // //       (record) =>
  // //           record.xStudioSalesRep1 != null &&
  // //           record.xStudioSalesRep1!.isNotEmpty,
  // //     )
  // //     .map((record) => record.xStudioSalesRep1!)
  // //     .toSet()
  // //     .toList();
  // final uniqueSalesReps = <String>[];

  return showDialog<List<int>>(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    builder: (BuildContext context) => FractionallySizedBox(
      widthFactor: 0.7,
      child: Dialog(
        backgroundColor: Colors.grey[100],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ColoredBox(
          color: Colors.transparent,
          child: BlocProvider(
            create: (context) => sl<UsersCubit>(),
            child: PickManager(
              selectedId: selectedId,
              currentUserId: currentUserId,
              currentUserAccessLevel: currentUserAccessLevel,
            ),
          ),
        ),
      ),
    ),
  );
}

class PickManager extends StatefulWidget {
  const PickManager({
    required this.selectedId,
    required this.currentUserId,
    required this.currentUserAccessLevel,
    super.key,
  });

  final List<int> selectedId;
  final int currentUserId;
  final int currentUserAccessLevel;

  @override
  State<PickManager> createState() => _PickManagerState();
}

class _PickManagerState extends State<PickManager> {
  TextEditingController ctrlSearch = TextEditingController();
  List<int> selectedId = [];
  int userAccessLevel = 1;

  @override
  void initState() {
    selectedId.addAll(widget.selectedId);
    _getUserFromHive();
    super.initState();
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    userAccessLevel = user?.accessLevel ?? 1;
    setState(() {});
  }

  // Future<List<AwsUser>> fetchAwsUsers(UsersCubit cubit) async {
  //   try {
  //     final users = await cubit.fetchAwsUsers();
  //     return users;
  //   } catch (e) {
  //     print('Error fetching users: $e');
  //     return [];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();

    // if (widget.salesRep.isNotEmpty) {
    return BlocBuilder<UsersCubit, UsersCubitState>(
      builder: (context, state) {
        if (state is UsersStateLoaded) {
          final higherUser = state.users
              .where(
                (e) =>
                    (e.accessLevel > 1 && e.accessLevel < 4) &&
                    e.id != widget.currentUserId &&
                    e.accessLevel >= widget.currentUserAccessLevel,
                //e.accessLevel > userAccessLevel
              )
              .toList();
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Select a Manager',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TextFormField(
                    controller: ctrlSearch,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0),
                      ),
                      labelStyle: TextStyle(color: Colors.green),
                      hintText: 'Start typing to search users...',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: higherUser.length, //+ 1,
                      itemBuilder: (context, index) {
                        // if (index ==
                        //     state.courseCategory.asData!.value.length) {
                        //   return CategoryCheckboxTile(
                        //     categoryName: 'Uncategorized',
                        //     isSelected: selectedId.contains(0),
                        //     onChanged: (e) {
                        //       setState(() {
                        //         selectedId.contains(0)
                        //             ? selectedId.remove(0)
                        //             : selectedId.add(0);
                        //       });
                        //     },
                        //   );
                        // }

                        return higherUser[index]
                                .displayName
                                .toLowerCase()
                                .contains(ctrlSearch.text.toLowerCase())
                            ? CategoryCheckboxTile(
                                categoryName: higherUser[index].displayName,
                                isSelected:
                                    selectedId.contains(higherUser[index].id),
                                onChanged: (e) {
                                  setState(() {
                                    if (selectedId.contains(
                                      higherUser[index].id,
                                    )) {
                                      selectedId.remove(
                                        higherUser[index].id,
                                      );
                                    } else {
                                      selectedId
                                        ..clear()
                                        ..add(
                                          higherUser[index].id,
                                        );
                                    }
                                  });
                                },
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //   Navigator.of(context, rootNavigator: true).pop();
                          Navigator.pop(context, selectedId);
                        },
                        style: btnLight,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xff344054),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          var hehe = selectedId;
                          Navigator.pop(context, selectedId);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff475467),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());

        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(child: CircularProgressIndicator());
        // } else if (snapshot.hasError) {
        //   return Center(child: Text('Error: ${snapshot.error}'));
        // } else if (snapshot.hasData) {
        //   final users = snapshot.data!;
        // } else {
        //   return const Center(child: CircularProgressIndicator());
        // }
      },
    );

    //  }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(
          child: Center(
            child: Text('No users found'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            style: btnLight,
            child: const Text(
              'Close',
              style: TextStyle(
                color: Color(0xff344054),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ButtonStyle btnLight = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: const Color(0xffFFFFFF),
    side: const BorderSide(
      color: Color(0xffD0D5DD),
    ),
  );
}

class CategoryCheckboxTile extends StatelessWidget {
  const CategoryCheckboxTile({
    required this.categoryName,
    required this.isSelected,
    required this.onChanged,
    super.key,
  });
  final String categoryName;
  final bool isSelected;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            categoryName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          activeColor: Colors.grey[200],
          checkColor: const Color(0xff7F56D9),
          selected: isSelected,
          value: isSelected,
          onChanged: onChanged,
        ),
        const Divider(),
      ],
    );
  }
}
