import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:water_analytics_australia/2_application/pages/home_page.dart';

class WaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WaAppBar({
    required this.title,
    this.showBackButton = true,
    super.key,
  });

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (context.canPop()) return context.pop();
      context.pushNamed(HomePage.name);
    }

    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 24),
              child: BackButton(
                color: Colors.black,
                onPressed: onPressed,
              ),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xFF1D2939),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
