// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/bloc/admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/widget/cloud_sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/create_users_page/bloc/create_users_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/cubit/landing_price_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/cubit/landing_price_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/widget/landing_price_card.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

//stl

class CreateUsersPageWrapperProvider extends StatelessWidget {
  const CreateUsersPageWrapperProvider({super.key, this.onUserCreated});
  final void Function()? onUserCreated;
  // final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateUsersCubit>(),
      child: CreateUserPage(onUserCreated: onUserCreated),
    );
  }
}

// class CreateUsersPage extends StatefulWidget {
//   const CreateUsersPage({super.key, this.onUserCreated});

//   final void Function()? onUserCreated;

//   static const name = 'createUsers';
//   static const path = '/createUsers';

//   // final String id;

//   @override
//   State<CreateUsersPage> createState() => _CreateUsersPageState();
// }

// class _CreateUsersPageState extends State<CreateUsersPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//   final ctrlSearch = TextEditingController();
//   bool isValidating = false;

//   @override
//   void initState() {
//     super.initState();
//     // context.read<CreateUsersCubit>().fetchUserById(widget.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: const Color(0xfff9fafb),
//       appBar: AppBar(
//         backgroundColor: Colors.black, //const Color(0xff0083ff),
//         title: const Text(
//           'Create User',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4),
//         child: BlocBuilder<CreateUsersCubit, CreateUsersCubitState>(
//           builder: (context, state) {
//             // if (state is CreateUsersStateLoading) {
//             //   return ListView.builder(
//             //     itemCount: 10,
//             //     itemBuilder: (context, index) => const Padding(
//             //       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//             //       child: ShimmerBox(
//             //         height: 110,
//             //       ),
//             //     ),
//             //   );
//             // } else if (state is CreateUsersStateLoaded) {
//             return const CreateUserPage(
//                 //     user: state.user,
//                 );
//             // } else if (state is CreateUsersStateError) {
//             //   return SalesListPageError(
//             //     onRefresh: () {},

//             //     //  =>
//             //     //     context.read<CreateUsersCubit>().fetchUserById(
//             //     //           widget.id,
//             //     //         ),
//             //   );
//             // }
//             // return const SizedBox(
//             //   child: Text('unknown'),
//             // );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SalesListPageError extends StatelessWidget {
//   const SalesListPageError({
//     required this.onRefresh,
//     super.key,
//   });
//   final void Function()? onRefresh;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Something went wrong',
//           ),
//           const SizedBox(height: 32),
//           ElevatedButton(
//             onPressed: onRefresh,
//             child: const Text('Refresh'),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key, this.onUserCreated});

  final void Function()? onUserCreated;

  static const name = 'createUsers';
  static const path = '/createUsers';

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlCommissionSplit = TextEditingController();
  // TextEditingController ctrlInstallationService = TextEditingController();
  // TextEditingController ctrlSupplyOnly = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    ctrlCommissionSplit.text = 50.toString();
    // ctrlInstallationService.text =
    //     widget.landingPrice.installationService.toString();
    // ctrlSupplyOnly.text = widget.landingPrice.supplyOnly.toString();
    super.initState();
  }

  int? accessLevel;

  final List<String> leadSource = [
    'Sales Person',
    'Sales Team Manager',
    'Sales Manager',
    'Admin',
    'Super Admin',
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateUsersCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, //const Color(0xff0083ff),
        title: const Text(
          'Create User',
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          if (widget.onUserCreated != null) ...[
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const HeroIcon(HeroIcons.xMark),
            ),
          ],
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    '',
                    // widget.user
                    //     .displayName, //widget.landingPrice.internalReference,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  ctrl: ctrlName,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Name',
                  isValidating: isValidating,
                ),
                CustomTextField(
                  ctrl: ctrlEmail,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Email',
                  isValidating: isValidating,
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  ctrl: ctrlCommissionSplit,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Commission Split (%)',
                  isValidating: isValidating,
                  inputType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                // CustomTextField(
                //   ctrl: ctrlCommissionSplit,
                //   onChanged: (value) {
                //     setState(() {});
                //   },
                //   title: 'Commission Split (%)',
                //   isValidating: isValidating,
                //   inputType:
                //       const TextInputType.numberWithOptions(decimal: true),
                // ),
                const Text(
                  'User Role',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text('Select Role'),
                  value: accessLevel == null
                      ? null
                      : accessLevelToString(accessLevel!),
                  items: leadSource
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      accessLevel = stringToAccessLevel(value ?? '');
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff475467),
          ),
          onPressed: () async {
            if (ctrlCommissionSplit.text.isEmpty) {
              setState(() {
                isValidating = true;
              });
            } else {
              setState(() {
                isValidating = false;
              });
            }

            if (isValidating == false) {
              unawaited(showSavingModal(context));
              final success = await cubit.createAwsUser(
                AwsUser(
                  id: 0,
                  displayName: ctrlName.text,
                  email: ctrlEmail.text,
                  accessLevel: accessLevel ?? 1,
                  commissionSplit:
                      double.tryParse(ctrlCommissionSplit.text) ?? 0,
                  salesManagerId: null,
                  selfGen: 1000,
                  companyLead: 500,
                  plainText: '',
                ),
              );

              if (success) {
                if (context.mounted) {
                  context.pop();
                }

                const snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Successfully created user.'),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (widget.onUserCreated != null) {
                  widget.onUserCreated!();
                }
              } else {
                if (context.mounted) {
                  context.pop();
                }

                const snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Failed to create user.'),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showSavingModal(
  BuildContext context,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            color: Color(0xff0083ff),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Creating User...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
