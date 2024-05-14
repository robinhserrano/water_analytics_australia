import 'package:flutter/material.dart';

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

class SortFilterModal extends StatefulWidget {
  const SortFilterModal({super.key});

  @override
  State<SortFilterModal> createState() => _SortFilterModalState();
}

class _SortFilterModalState extends State<SortFilterModal> {
  CourseSortBy? selectedSort;
  @override
  void initState() {
    selectedSort = CourseSortBy.newestFirst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                children: [
                  const Text(
                    'Sort & Filter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {}, //HomePage.closeDrawer,
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
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
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Divider(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Filter by',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: true, //enrolledCourse,
                    onChanged: (value) {
                      // setState(() {
                      //   enrolledCourse = !enrolledCourse;
                      // });
                    },
                  ),
                  const Text(
                    'My Quotations',
                    style: TextStyle(fontSize: 16, color: Color(0xff243242)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: false, //enrolledCourse,
                    onChanged: (value) {
                      // setState(() {
                      //   enrolledCourse = !enrolledCourse;
                      // });
                    },
                  ),
                  const Text(
                    'Recurring',
                    style: TextStyle(fontSize: 16, color: Color(0xff243242)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: false, //enrolledCourse,
                    onChanged: (value) {
                      // setState(() {
                      //   enrolledCourse = !enrolledCourse;
                      // });
                    },
                  ),
                  const Text(
                    'Not Recurring',
                    style: TextStyle(fontSize: 16, color: Color(0xff243242)),
                  ),
                ],
              ),
            ),
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
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 16, left: 16),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
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
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
