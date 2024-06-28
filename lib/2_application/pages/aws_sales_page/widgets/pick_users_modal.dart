import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/bloc/users_cubit.dart';
import 'package:water_analytics_australia/injection.dart';

Future<List<String>?> showPickUsers(
  BuildContext context,
  List<String> selectedNames,
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

  return showDialog<List<String>>(
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
            child: PickUsers(
              selectedNames: selectedNames,
            ),
          ),
        ),
      ),
    ),
  );
}

class PickUsers extends StatefulWidget {
  const PickUsers({
    required this.selectedNames,
    super.key,
  });

  final List<String> selectedNames;

  @override
  State<PickUsers> createState() => _PickUsersState();
}

class _PickUsersState extends State<PickUsers> {
  TextEditingController ctrlSearch = TextEditingController();
  List<String> selectedNames = [];

  @override
  void initState() {
    selectedNames.addAll(widget.selectedNames);
    super.initState();
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
          //state.users; 

          //FIX THISSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
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
                    'Select Users',
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
                      itemCount: state.users.length, //+ 1,
                      itemBuilder: (context, index) {
                        // if (index ==
                        //     state.courseCategory.asData!.value.length) {
                        //   return CategoryCheckboxTile(
                        //     categoryName: 'Uncategorized',
                        //     isSelected: selectedNames.contains(0),
                        //     onChanged: (e) {
                        //       setState(() {
                        //         selectedNames.contains(0)
                        //             ? selectedNames.remove(0)
                        //             : selectedNames.add(0);
                        //       });
                        //     },
                        //   );
                        // }

                        return state.users[index].displayName
                                .toLowerCase()
                                .contains(ctrlSearch.text.toLowerCase())
                            ? CategoryCheckboxTile(
                                categoryName: state.users[index].displayName,
                                isSelected: selectedNames
                                    .contains(state.users[index].displayName),
                                onChanged: (e) {
                                  setState(() {
                                    selectedNames.contains(
                                      state.users[index].displayName,
                                    )
                                        ? selectedNames.remove(
                                            state.users[index].displayName,
                                          )
                                        : selectedNames.add(
                                            state.users[index].displayName,
                                          );
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
                           Navigator.pop(context, selectedNames);
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
                          var hehe = selectedNames;
                          Navigator.pop(context, selectedNames);
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
