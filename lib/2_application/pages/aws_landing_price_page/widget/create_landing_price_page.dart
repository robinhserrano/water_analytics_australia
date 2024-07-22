import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/cubit/aws_landing_price_cubit.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({required this.cubit, super.key, this.onUserCreated});

  final void Function()? onUserCreated;
  final AwsLandingPriceCubit cubit;

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
    final cubit = widget.cubit;

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
            child: ListView(
              //    crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(
                  height: 80,
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
              final success = await cubit.saveAwsLandingPrices(
                ctrlName.text,
                ctrlName.text,
                ctrlName.text,
                double.tryParse(ctrlName.text) ?? 0,
                double.tryParse(ctrlName.text) ?? 0,
                DateTime.now(),
                //FIX THIS
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
            'Creating Landing Price...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
