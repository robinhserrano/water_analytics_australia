import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/view/aws_landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/view/landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';

class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Box<UserHive>>(
                  future: Hive.openBox<UserHive>('user'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final userBox = snapshot.data!;
                      final user = userBox.values.toList();
                      return Column(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            child: HeroIcon(
                              HeroIcons.userCircle,
                              size: 60,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // Text(
                          //   textAlign: TextAlign.center,
                          //   user.first.displayName ??
                          //       (user.first.userName ?? 'USER_NAME'),
                          //   style: const TextStyle(fontSize: 16),
                          // ),
                          // const SizedBox(
                          //   height: 4,
                          // ),
                          Text(
                            textAlign: TextAlign.center,
                            user.first.email ??
                                (user.first.userLogin ?? 'USER_LOGIN'),
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            _getTextForAccessLevel(user.first.accessLevel),
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          if (user.first.accessLevel >= 4) ...[
                            _DrawerItem(
                              onTap: () {
                                context.pushNamed(LandingPricePage.name);
                              },
                              text: 'Landing Price',
                            ),
                            const Divider(
                              height: 1,
                            ),
                          ],
                          if (user.first.accessLevel >= 4) ...[
                            _DrawerItem(
                              onTap: () {
                                context.pushNamed(AwsLandingPricePage.name);
                              },
                              text: 'AWS Landing Price',
                            ),
                            const Divider(
                              height: 1,
                            ),
                          ],
                        ],
                      );
                    }
                  },
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  final userBox = await Hive.openBox<UserHive>('user');
                  await userBox.clear();
                  final sortBox =
                      await Hive.openBox<SortFilterHive>('sortFilter');
                  await sortBox.clear();
                  if (!kIsWeb) {
                    await GoogleSignIn().signOut();
                  }

                  if (context.mounted) {
                    context.pushReplacementNamed(LoginPage.name);
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style:
                              TextStyle(color: Color(0xffda5450), fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getTextForAccessLevel(int accessLevel) {
  switch (accessLevel) {
    case 1:
      return 'Sales Person';
    case 2:
      return 'Sales Team Manager';
    case 3:
      return 'Sales Manager';
    case 4:
      return 'Admin';
    case 5:
      return 'Super Admin';
    default:
      return 'Unknown';
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(
                text,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
