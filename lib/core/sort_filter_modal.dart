// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:heroicons/heroicons.dart';
// import 'package:lms_mobile_app/application/pages/content/bloc/course_category_cubit.dart';
// import 'package:lms_mobile_app/application/pages/home/bloc/courses_cubit.dart';
// import 'package:lms_mobile_app/application/pages/home/home_page.dart';
// import 'package:lms_mobile_app/application/pages/unit/widgets/pick_category_modal.dart';
// import 'package:lms_mobile_app/data/models/course_filter_model.dart';
// import 'package:lms_mobile_app/data/repositories/auth_repository.dart';
// import 'package:lms_mobile_app/data/repositories/content_repository.dart';
// import 'package:lms_mobile_app/injection.dart';

// class SortFilterModal extends StatelessWidget {
//   const SortFilterModal({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final courseCubit = context.read<CoursesCubit>();

//     return BlocProvider(
//       create: (context) => CourseCategoryCubit(
//         repository: getIt<ContentRepository>(),
//       ),
//       child: SortFilterModalView(
//         courseCubit: courseCubit,
//       ),
//     );
//   }
// }

// class SortFilterModalView extends StatefulHookWidget {
//   const SortFilterModalView({
//     required this.courseCubit,
//     super.key,
//   });

//   final CoursesCubit courseCubit;

//   @override
//   State<SortFilterModalView> createState() => _SortFilterModalViewState();
// }

// class _SortFilterModalViewState extends State<SortFilterModalView> {
//   CourseFilterBy? selectedFilter;
//   CourseSortBy? selectedSort;

//   List<String> categoryNames = [];
//   List<int> categoryIds = [];

//   bool availableCourse = false;
//   bool enrolledCourse = true;

//   @override
//   void initState() {
//     selectedFilter = widget.courseCubit.state.filterBy;
//     selectedSort = widget.courseCubit.state.sortBy;
//     availableCourse = widget.courseCubit.state.availableCourse;
//     enrolledCourse = widget.courseCubit.state.enrolledCourse;
//     categoryIds = List.from(
//       widget.courseCubit.state.courseCategory.map(int.parse).toList(),
//     );

//     categoryNames = List.from(widget.courseCubit.state.courseCategory);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.watch<CoursesCubit>();
//     final future = useMemoized(() => getIt<AuthRepository>().getUserInfo());
//     final snapshot = useFuture(future);
//     final hasEnrollment =
//         (snapshot.data?.lmsSettings ?? []).any((e) => e == 'course_enrollment');

//     return Drawer(
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 20,
//                 ),
//                 child: GestureDetector(
//                   onTap: HomePage.closeDrawer,
//                   child: const Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Icon(Icons.close),
//                     ),
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 24, top: 20),
//                 child: Text(
//                   'Sort by',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Column(
//                 children: CourseSortBy.values.map((sortBy) {
//                   return SizedBox(
//                     height: 35,
//                     child: RadioListTile<CourseSortBy>(
//                       title: Text(
//                         sortBy.name,
//                         style: const TextStyle(color: Color(0xff243242)),
//                       ),
//                       value: sortBy,
//                       groupValue: selectedSort,
//                       onChanged: (selected) {
//                         setState(() {
//                           selectedSort = selected;
//                         });
//                       },
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 24, top: 20),
//                 child: Text(
//                   'Filter by',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Column(
//                 children: CourseFilterBy.values.map((filter) {
//                   return SizedBox(
//                     height: 35,
//                     child: RadioListTile<CourseFilterBy>(
//                       title: Text(
//                         filter.name,
//                         style: const TextStyle(color: Color(0xff243242)),
//                       ),
//                       value: filter,
//                       groupValue: selectedFilter,
//                       onChanged: (selected) {
//                         setState(() {
//                           selectedFilter = selected;
//                         });
//                       },
//                     ),
//                   );
//                 }).toList(),
//               ),
//               if (hasEnrollment) ...[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12, top: 8),
//                   child: Row(
//                     children: [
//                       Checkbox(
//                         value: enrolledCourse,
//                         onChanged: (value) {
//                           setState(() {
//                             enrolledCourse = !enrolledCourse;
//                           });
//                         },
//                       ),
//                       const Text(
//                         'Show Enrolled Courses',
//                         style: TextStyle(color: Color(0xff243242)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12),
//                   child: Row(
//                     children: [
//                       Checkbox(
//                         value: availableCourse,
//                         onChanged: (value) {
//                           setState(() {
//                             availableCourse = !availableCourse;
//                           });
//                         },
//                       ),
//                       const Text(
//                         'Show Available Courses',
//                         style: TextStyle(color: Color(0xff243242)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//               const Padding(
//                 padding: EdgeInsets.only(left: 24, top: 12),
//                 child: Text(
//                   'Course Categories',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 12,
//                 ),
//                 child: OutlinedButton(
//                   onPressed: null,
//                   child: Row(
//                     children: [
//                       const Text(
//                         'Select Categories',
//                         style: TextStyle(
//                           color: Color(0xff667085),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const Spacer(),
//                       ElevatedButton(
//                         onPressed: () async {
//                           final data =
//                               await showPickCategories(context, categoryIds);

//                           if (data != null) {
//                             setState(() {
//                               categoryIds = data;
//                               categoryIds = categoryIds.toSet().toList();
//                             });
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           elevation: 0,
//                           backgroundColor: const Color(0xff7F56D9),
//                         ),
//                         child: categoryIds.isEmpty
//                             ? const Text(
//                                 'Select',
//                                 style: TextStyle(fontWeight: FontWeight.w600),
//                               )
//                             : Row(
//                                 children: [
//                                   const HeroIcon(
//                                     HeroIcons.tag,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     categoryIds.length.toString(),
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 margin: const EdgeInsets.only(right: 16, left: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         cubit
//                           ..clearFilters()
//                           ..fetchCourses();

//                         HomePage.closeDrawer();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         backgroundColor: const Color(0xffFFFFFF),
//                         side: const BorderSide(
//                           color: Color(0xffD0D5DD),
//                         ),
//                       ),
//                       child: const Text(
//                         'Reset',
//                         style: TextStyle(
//                           color: Color(0xff344054),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     SizedBox(
//                       width: 80,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (!cubit.isClosed) {
//                             cubit
//                               ..updateSort(selectedSort)
//                               ..updateFilter(selectedFilter)
//                               ..updateCourseCategories(
//                                 categoryIds.map((id) => id.toString()).toList(),
//                               )
//                               ..toggleShowEnrolledCourses(value: enrolledCourse)
//                               ..toggleShowAvailableCourses(
//                                 value: availableCourse,
//                               )
//                               ..fetchCourses();
//                           }
//                           if (context.mounted) {
//                             HomePage.closeDrawer();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           elevation: 0,
//                           backgroundColor: const Color(0xff475467),
//                         ),
//                         child: const Text(
//                           'Apply',
//                           style: TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
