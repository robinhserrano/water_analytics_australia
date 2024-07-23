// // ignore_for_file: prefer_null_aware_method_calls

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:heroicons/heroicons.dart';
// import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
// import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/cubit/aws_landing_price_cubit.dart';
// import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';

// class EditLandingPrice extends StatefulWidget {
//   const EditLandingPrice({
//     required this.cubit,
//     required this.id,
//     super.key,
//     this.onLandingPriceEdited,
//   });

//   final void Function()? onLandingPriceEdited;
//   final AwsLandingPriceCubit cubit;
//   final int id;

//   static const name = 'editLandingPrice';
//   static const path = '/editLandingPrice';

//   @override
//   State<EditLandingPrice> createState() => _EditLandingPriceState();
// }

// class _EditLandingPriceState extends State<EditLandingPrice> {
//   TextEditingController ctrlInternalReference = TextEditingController();
//   TextEditingController ctrlProductName = TextEditingController();
//   TextEditingController ctrlInstallationService = TextEditingController();
//   TextEditingController ctrlSupplyOnly = TextEditingController();
//   bool isValidating = false;

//   @override
//   void initState() {
//     final state = widget.cubit.state;
//     AwsLandingPrice? landingPrice;
//     var hehe = state;
//     if (state is AwsLandingPriceStateLoaded) {
//       landingPrice = state.records.firstWhere((e) => e.id == widget.id);
//     }

//     if (landingPrice != null) {
//       final history = landingPrice.history!.toList()
//         ..sort(
//           (a, b) => b.recordedAt!.compareTo(a.recordedAt!),
//         );

//       ctrlInternalReference.text = landingPrice.internalReference ?? '';
//       ctrlProductName.text = landingPrice.name ?? '';
//       ctrlInstallationService.text =
//           (history.first.installationService ?? 0).toString();
//       ctrlSupplyOnly.text = (history.first.supplyOnly ?? 0).toString();
//     } else {
//       ctrlInstallationService.text = 0.toString();
//       ctrlSupplyOnly.text = 0.toString();
//     }

//     super.initState();
//   }

//   int? accessLevel;

//   final List<String> leadSource = [
//     'Sales Person',
//     'Sales Team Manager',
//     'Sales Manager',
//     'Admin',
//     'Super Admin',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final cubit = widget.cubit;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black, //const Color(0xff0083ff),
//         title: const Text(
//           'Edit Landing Price',
//           style: TextStyle(color: Colors.white),
//         ),

//         actions: [
//           if (widget.onLandingPriceEdited != null) ...[
//             IconButton(
//               onPressed: () {
//                 context.pop();
//               },
//               icon: const HeroIcon(HeroIcons.xMark),
//             ),
//           ],
//         ],
//       ),
//       body: Center(
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: 600),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: ListView(
//               //    crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     '',
//                     // widget.LandingPrice
//                     //     .displayName, //widget.landingPrice.internalReference,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomTextField(
//                   ctrl: ctrlInternalReference,
//                   onChanged: (value) {
//                     setState(() {});
//                   },
//                   title: 'Internal Reference',
//                   isValidating: isValidating,
//                 ),
//                 CustomTextField(
//                   ctrl: ctrlProductName,
//                   onChanged: (value) {
//                     setState(() {});
//                   },
//                   title: 'Product Name',
//                   isValidating: isValidating,
//                 ),
//                 // CustomTextField(
//                 //   ctrl: ctrlProductName,
//                 //   onChanged: (value) {
//                 //     setState(() {});
//                 //   },
//                 //   title: 'Category',
//                 //   isValidating: isValidating,
//                 // ),
//                 CustomTextField(
//                   ctrl: ctrlInstallationService,
//                   onChanged: (value) {
//                     setState(() {});
//                   },
//                   title: 'Installation Service',
//                   isValidating: isValidating,
//                   inputType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                 ),
//                 CustomTextField(
//                   ctrl: ctrlSupplyOnly,
//                   onChanged: (value) {
//                     setState(() {});
//                   },
//                   title: 'Supply Only',
//                   isValidating: isValidating,
//                   inputType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                 ),
//                 // CustomTextField(
//                 //   ctrl: ctrlInstallationService,
//                 //   onChanged: (value) {
//                 //     setState(() {});
//                 //   },
//                 //   title: 'Commission Split (%)',
//                 //   isValidating: isValidating,
//                 //   inputType:
//                 //       const TextInputType.numberWithOptions(decimal: true),
//                 // ),
//                 const SizedBox(
//                   height: 80,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomSheet: Container(
//         height: 60,
//         color: Colors.white,
//         width: double.infinity,
//         padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             elevation: 0,
//             backgroundColor: const Color(0xff475467),
//           ),
//           onPressed: () async {
//             if (ctrlInstallationService.text.isEmpty) {
//               setState(() {
//                 isValidating = true;
//               });
//             } else {
//               setState(() {
//                 isValidating = false;
//               });
//             }

//             if (isValidating == false) {
//               unawaited(showSavingModal(context));
//               final success = await cubit.saveAwsLandingPrices(
//                 ctrlInternalReference.text,
//                 ctrlProductName.text,
//                 '',
//                 double.tryParse(ctrlInstallationService.text) ?? 0,
//                 double.tryParse(ctrlSupplyOnly.text) ?? 0,
//               );

//               if (success) {
//                 if (context.mounted) {
//                   context.pop();
//                 }

//                 const snackBar = SnackBar(
//                   backgroundColor: Colors.green,
//                   content: Text('Successfully updated Landing Price.'),
//                 );

//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 }

//                 if (widget.onLandingPriceEdited != null) {
//                   widget.onLandingPriceEdited!();
//                 }
//               } else {
//                 if (context.mounted) {
//                   context.pop();
//                 }

//                 const snackBar = SnackBar(
//                   backgroundColor: Colors.red,
//                   content: Text('Failed to update Landing Price.'),
//                 );

//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 }
//               }
//             }
//           },
//           child: const Text(
//             'Save',
//             style: TextStyle(
//               color: Color(0xffFFFFFF),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<void> showSavingModal(
//   BuildContext context,
// ) {
//   return showDialog(
//     barrierColor: Colors.black.withOpacity(0.3),
//     context: context,
//     builder: (BuildContext dialogCon) => AlertDialog(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       title: const Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           CircularProgressIndicator(
//             color: Color(0xff0083ff),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Text(
//             'Creating Landing Price...',
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     ),
//   );
// }
