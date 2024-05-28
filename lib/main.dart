import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/core/routes.dart';
import 'package:water_analytics_australia/firebase_options.dart';
import 'package:water_analytics_australia/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..registerAdapter(UserHiveAdapter())
    ..registerAdapter(SortFilterHiveAdapter());

  await Hive.initFlutter();

  await Hive.openBox<UserHive>('user');
  await Hive.openBox<SortFilterHive>('sortFilter');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
        // primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),

        // dividerColor: Colors.white,
        cardTheme: const CardTheme(color: Colors.white),
        // dialogBackgroundColor: Colors.white,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(

        //   backgroundColor: Colors.white,
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white,
        // ),
        // scrollbarTheme: ScrollbarThemeData(
        //   thumbColor: MaterialStateProperty.all<Color>(Colors.white),
        // ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: lightColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      title: 'WA Commission App',
      routerConfig: routes,
    );
  }
}

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white,
);

ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.teal, // Change this to your desired primary color
  brightness: Brightness.dark,
);

ThemeData myTheme = ThemeData(
  // ... other theme properties
  colorScheme: lightColorScheme, // Use lightColorScheme by default
  brightness: Brightness
      .light, // Can be set based on user preference or system defaults
  // ... other theme properties
);
