import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/qoutation_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/view/sales_details_page.dart';
import 'package:water_analytics_australia/core/helper.dart';

class SalesRecordCard extends StatelessWidget {
  const SalesRecordCard({required this.record, super.key});
  final QuotationRecord record;
  // final SalesCubit cubit;

  @override
  Widget build(BuildContext context) {
    //final parsedData = parseProductQuantities(invoice.systemDetailsAndNote);

    return GestureDetector(
      onTap: () => context.pushNamed(
        SalesDetailsPage.name,
        pathParameters: {'id': 1.toString()},
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xffdddfe2)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        record.partnerId?.displayName ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      formatCurrency(record.amountToInvoice ?? 0),
                      style: const TextStyle(fontSize: 16),
                    ),

                    // CustomPopMenu(
                    //   saleId: invoice.id!,
                    //   cubit: cubit,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            '${record.name}',
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                          const Text(
                            ' - ',
                            style: TextStyle(color: Color(0xff7a7a7a)),
                          ),
                          Text(
                            record.dateOrder == null
                                ? ''
                                : DateFormat('yyyy/MM/dd hh:mm a')
                                    .format(record.dateOrder!),
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: record.state == 'sale'
                              ? const Color(0xff2ca444)
                              : const Color(0xffd8dadd),
                        ),
                        color: record.state == 'sale'
                            ? const Color(0xff2ca444)
                            : const Color(0xffd8dadd),
                      ),
                      child: Text(
                        record.state == 'sale' ? 'Sales Order' : 'Cancelled',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: record.state == 'sale'
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ),
                    // Text(
                    //   capitalizeFirstLetter(invoice.customerPayment),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //     color: invoice.customerPayment.toLowerCase() == 'unpaid'
                    //         ? Colors.red
                    //         : invoice.customerPayment.toLowerCase() == 'partial'
                    //             ? Colors.orange
                    //             : Colors.green,
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),
                // if (parsedData.isNotEmpty) ...[
                //   customCard(
                //     Column(
                //       children: [
                //         ...parsedData.map(
                //           (
                //             product,
                //           ) =>
                //               Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 product.product,
                //                 maxLines: 2,
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 children: [
                //                   Text(
                //                     'Qty: ${product.quantity}',
                //                     style: const TextStyle(
                //                       color: Color(0xff7a7a7a),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ] else ...[
                //   customCard(
                //     HtmlWidget(
                //       invoice.systemDetailsAndNote,
                //     ),
                //   ),
                // ],
                //ADD
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customCard(Widget child) {
  return Column(
    children: [
      Card(
        color: const Color(0xfff5faff),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              const Text(
                'Job Details',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              child,
            ],
          ),
        ),
      ),
    ],
  );
}

// class CustomPopMenu extends StatefulWidget {
//   const CustomPopMenu({
//     required this.saleId,
//     required this.cubit,
//     super.key,
//   });
//   final String saleId;
//   final SalesCubit cubit;

//   @override
//   State<CustomPopMenu> createState() => _CustomPopMenuState();
// }

// class _CustomPopMenuState extends State<CustomPopMenu> {
//   CustomPopupMenuController controller = CustomPopupMenuController();

//   @override
//   Widget build(BuildContext context) {
//     final menuItems = [
//       ItemModel('Delete Item', HeroIcons.trash, 0),
//     ];

//     if (menuItems.isEmpty) return const SizedBox.shrink();

//     return CustomPopupMenu(
//       arrowColor: Colors.white,
//       menuBuilder: () => ClipRRect(
//         borderRadius: BorderRadius.circular(5),
//         child: ColoredBox(
//           color: Colors.white,
//           child: IntrinsicWidth(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: menuItems
//                   .map(
//                     (item) => GestureDetector(
//                       behavior: HitTestBehavior.translucent,
//                       onTap: () {
//                         if (item.index == 0) {
//                           showDeleteSaleModal(
//                             context,
//                             widget.saleId,
//                             widget.cubit,
//                           );
//                         }

//                         controller.hideMenu();
//                       },
//                       child: Container(
//                         height: 40,
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Container(
//                           margin: const EdgeInsets.only(left: 10),
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             item.title,
//                             style: TextStyle(
//                               color: item.index == 0
//                                   ? const Color(0xffD92D20)
//                                   : const Color(0xff1D2939),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ),
//       ),
//       pressType: PressType.singleClick,
//       verticalMargin: -10,
//       controller: controller,
//       child: const Icon(Icons.more_vert, color: Color(0xff0F172A)),
//     );
//   }
// }

// Future<void> showDeleteSaleModal(
//   BuildContext context,
//   String saleId,
//   SalesCubit cubit,
// ) {
//   return showDialog(
//     barrierColor: Colors.black.withOpacity(0.3),
//     context: context,
//     builder: (BuildContext dialogCon) => AlertDialog(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       title: DeleteSaleModal(
//         saleId: saleId,
//         cubit: cubit,
//       ),
//     ),
//   );
// }

// class DeleteSaleModal extends StatefulWidget {
//   const DeleteSaleModal({
//     required this.saleId,
//     required this.cubit,
//     super.key,
//   });
//   final String saleId;
//   final SalesCubit cubit;

//   @override
//   State<DeleteSaleModal> createState() => _DeleteSaleModalState();
// }

// class _DeleteSaleModalState extends State<DeleteSaleModal> {
//   bool isDeleting = false;

//   @override
//   Widget build(BuildContext context) {
//     return isDeleting
//         ? const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CircularProgressIndicator(
//                 color: Color(0xff7F56D9),
//               ),
//               Text(
//                 'Deleting Item',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           )
//         : Column(
//             children: [
//               const Text(
//                 'Are you sure you want to delete ?',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         context.pop();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         backgroundColor: const Color(0xffB3B7C2),
//                       ),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: Color(0xffFFFFFF),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     ElevatedButton(
//                       onPressed: () async {
//                         setState(() {
//                           isDeleting = true;
//                         });

//                         final isDeleted =
//                             await widget.cubit.deleteById(widget.saleId);

//                         if (isDeleted) {
//                           const snackBar = SnackBar(
//                             backgroundColor: Colors.red,
//                             content: Text('Successfully deleted item.'),
//                           );

//                           // ignore: use_build_context_synchronously
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                           // ignore: use_build_context_synchronously
//                           context.pop();
//                         }

//                         await widget.cubit.fetch();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         backgroundColor: const Color(0xffD92D20),
//                       ),
//                       child: const Text(
//                         'Delete',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//   }
// }

// class ItemModel {
//   ItemModel(this.title, this.icon, this.index);
//   String title;
//   HeroIcons icon;
//   int index;
// }
