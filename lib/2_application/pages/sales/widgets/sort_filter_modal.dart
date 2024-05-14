// ignore_for_file: inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/sort_filter_model.dart';
import 'package:water_analytics_australia/2_application/pages/sales/bloc/cubit/sort_filter_cubit.dart';
import 'package:water_analytics_australia/injection.dart';

enum CourseSortBy {
  newestFirst,
  oldestFirst,
  aZCourseName,
  zACourseName;

  String get name {
    return switch (this) {
      CourseSortBy.newestFirst => 'Newest',
      CourseSortBy.oldestFirst => 'Oldest',
      CourseSortBy.aZCourseName => 'A-Z',
      CourseSortBy.zACourseName => 'Z-A',
    };
  }

  // String get backendName {
  //   return switch (this) {
  //     CourseSortBy.highToLowProgress => 'htl',
  //     CourseSortBy.lowToHighProgress => 'lth',
  //     CourseSortBy.aZCourseName => 'a-z',
  //     CourseSortBy.zACourseName => 'z-a',
  //   };
  // }
}

// class SortFilterModalWrapperProvider extends StatelessWidget {
//   const SortFilterModalWrapperProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<SortFilterCubit>(),
//       child: SortFilterModal(),
//     );
//   }
// }

class SortFilterModal extends StatefulWidget {
  const SortFilterModal({super.key});

  @override
  State<SortFilterModal> createState() => _SortFilterModalState();
}

class _SortFilterModalState extends State<SortFilterModal> {
  CourseSortBy? selectedSort;
  List<CommissionStatus> selectedCommissionStatus = [];
  List<InvoicePaymentStatus> selectedInvoicePaymentStatus = [];
  List<DeliveryStatus> selectedDeliverStatus = [];

  @override
  void initState() {
    final userBox = Hive.box<SortFilterHive>('sortFilter');
    if (userBox.values.isNotEmpty) {
      selectedCommissionStatus = userBox.values.first.selectedCommissionStatus;
      selectedInvoicePaymentStatus =
          userBox.values.first.selectedInvoicePaymentStatus;
      selectedDeliverStatus = userBox.values.first.selectedDeliverStatus;
    }

    selectedSort = CourseSortBy.newestFirst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomSheet: ColoredBox(
            color: Colors.white,
            //  margin: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // cubit
                        //   ..clearFilters()
                        //   ..fetchCourses();

                        // HomePage.closeDrawer();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xffFFFFFF),
                        side: const BorderSide(
                          color: Color(0xffD0D5DD),
                        ),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Color(0xff344054),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        final sortFilterBox =
                            Hive.box<SortFilterHive>('sortFilter');
                        await sortFilterBox.clear();
                        await sortFilterBox.add(
                          SortFilterHive(
                            selectedCommissionStatus,
                            selectedInvoicePaymentStatus,
                            selectedDeliverStatus,
                          ),
                        );
                        // if (!cubit.isClosed) {
                        //   cubit
                        //     ..updateSort(selectedSort)
                        //     ..updateFilter(selectedFilter)
                        //     ..updateCourseCategories(
                        //       categoryIds.map((id) => id.toString()).toList(),
                        //     )
                        //     ..toggleShowEnrolledCourses(value: enrolledCourse)
                        //     ..toggleShowAvailableCourses(
                        //       value: availableCourse,
                        //     )
                        //     ..fetchCourses();
                        // }
                        // if (context.mounted) {
                        //   HomePage.closeDrawer();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff475467),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Sort & Filter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {}, //HomePage.closeDrawer,
                child: const Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Divider(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  'Sort by',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                children: CourseSortBy.values.map((sortBy) {
                  return SizedBox(
                    height: 35,
                    child: RadioListTile<CourseSortBy>(
                      title: Text(
                        sortBy.name,
                        style: const TextStyle(color: Color(0xff243242)),
                      ),
                      value: sortBy,
                      groupValue: selectedSort,
                      onChanged: (selected) {
                        setState(() {
                          selectedSort = selected;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                ),
                child: Divider(),
              ),

              CommissionStatusCheckList(),
              // const CustomCheckBoxTile(
              //   title: 'Paid',
              //   value: false,
              // ),
              // const CustomCheckBoxTile(
              //   title: 'Not Paid',
              //   value: false,
              // ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Divider(),
              ),

              InvoicePaymentStatusCheckList(),
              // const CustomCheckBoxTile(
              //   title: 'Paid',
              //   value: false,
              // ),
              // const CustomCheckBoxTile(
              //   title: 'Not Paid',
              //   value: false,
              // ),
              // const CustomCheckBoxTile(
              //   title: 'Partially Paid',
              //   value: false,
              // ),
              // const CustomCheckBoxTile(
              //   title: 'Not Set',
              //   value: false,
              // ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Divider(),
              ),
              DeliveryStatusCheckList(),
              const SizedBox(height: 60),
              // Column(
              //   children: CourseFilterBy.values.map((filter) {
              //     return SizedBox(
              //       height: 35,
              //       child: RadioListTile<CourseFilterBy>(
              //         title: Text(
              //           filter.name,
              //           style: const TextStyle(color: Color(0xff243242)),
              //         ),
              //         value: filter,
              //         groupValue: selectedFilter,
              //         onChanged: (selected) {
              //           setState(() {
              //             selectedFilter = selected;
              //           });
              //         },
              //       ),
              //     );
              //   }).toList(),
              // ),
              // if (hasEnrollment) ...[
              //   Padding(
              //     padding: const EdgeInsets.only(left: 12, top: 8),
              //     child: Row(
              //       children: [
              //         Checkbox(
              //           value: enrolledCourse,
              //           onChanged: (value) {
              //             setState(() {
              //               enrolledCourse = !enrolledCourse;
              //             });
              //           },
              //         ),
              //         const Text(
              //           'Show Enrolled Courses',
              //           style: TextStyle(color: Color(0xff243242)),
              //         ),
              //       ],
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 12),
              //     child: Row(
              //       children: [
              //         Checkbox(
              //           value: availableCourse,
              //           onChanged: (value) {
              //             setState(() {
              //               availableCourse = !availableCourse;
              //             });
              //           },
              //         ),
              //         const Text(
              //           'Show Available Courses',
              //           style: TextStyle(color: Color(0xff243242)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String title;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Checkbox(
            value: value, //enrolledCourse,
            onChanged: onChanged,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Color(0xff243242)),
          ),
        ],
      ),
    );
  }
}

class CommissionStatusCheckList extends StatefulWidget {
  const CommissionStatusCheckList({super.key});

  @override
  State<CommissionStatusCheckList> createState() =>
      _CommissionStatusCheckListState();
}

class _CommissionStatusCheckListState extends State<CommissionStatusCheckList> {
  List<CommissionStatus> selectedStatus = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Commission Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Text(selectedStatus.toString()),
        ...CommissionStatus.values.map(
          (status) => CustomCheckBoxTile(
            title: status.name,
            value: selectedStatus
                .contains(status), // Update value based on selectedStatus
            onChanged: (newValue) => setState(() {
              if (newValue!) {
                setState(() {
                  selectedStatus.add(status);
                });
              } else {
                setState(() {
                  selectedStatus.remove(status);
                });
              }
            }),
          ),
        ),
      ],
    );
  }
}

class InvoicePaymentStatusCheckList extends StatefulWidget {
  const InvoicePaymentStatusCheckList({super.key});

  @override
  State<InvoicePaymentStatusCheckList> createState() =>
      _InvoicePaymentStatusCheckListState();
}

class _InvoicePaymentStatusCheckListState
    extends State<InvoicePaymentStatusCheckList> {
  List<InvoicePaymentStatus> selectedStatus = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Invoice Payment Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Text(selectedStatus.toString()),
        ...InvoicePaymentStatus.values.map(
          (status) => CustomCheckBoxTile(
            title: status.name,
            value: selectedStatus
                .contains(status), // Update value based on selectedStatus
            onChanged: (newValue) => setState(() {
              if (newValue!) {
                setState(() {
                  selectedStatus.add(status);
                });
              } else {
                setState(() {
                  selectedStatus.remove(status);
                });
              }
            }),
          ),
        ),
      ],
    );
  }
}

class DeliveryStatusCheckList extends StatefulWidget {
  const DeliveryStatusCheckList({super.key});

  @override
  State<DeliveryStatusCheckList> createState() =>
      _DeliveryStatusCheckListState();
}

class _DeliveryStatusCheckListState extends State<DeliveryStatusCheckList> {
  List<DeliveryStatus> selectedStatus = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Delivery Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Text(selectedStatus.toString()),
        ...DeliveryStatus.values.map(
          (status) => CustomCheckBoxTile(
            title: status.name,
            value: selectedStatus
                .contains(status), // Update value based on selectedStatus
            onChanged: (newValue) => setState(() {
              if (newValue!) {
                setState(() {
                  selectedStatus.add(status);
                });
              } else {
                setState(() {
                  selectedStatus.remove(status);
                });
              }
            }),
          ),
        ),
      ],
    );
  }
}
