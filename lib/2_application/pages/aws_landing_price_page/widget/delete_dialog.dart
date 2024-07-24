import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 329,
        height: 273,
        child: Material(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 28,
              right: 24,
              bottom: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeroIcon(
                  HeroIcons.informationCircle,
                  size: 50,
                  color: Color(0xFFD92D20),
                ),
                Text(
                  'Deleting your account is permanent, your profile, courses, '
                  'central account, and certificates will be permanently '
                  'deleted.',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFF000000),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CancelButton(),
                    _DeleteButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 41,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.fromBorderSide(
            BorderSide(color: Color(0xFF475467)),
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => context.pop(),
            child: Align(
              child: Text(
                'Cancel',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xFF475467),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(BuildContext context) {
    Future<void> delete() async {
      context.pop();
      // await showGeneralDialog(
      //   context: context,
      //   pageBuilder: (_, __, ___) {
      //     return const DeleteAccountConfirmationDialog();
      //   },
      // );
    }

    return SizedBox(
      width: 180,
      height: 41,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xFFD92D20),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () async => delete(),
            child: Align(
              child: Text(
                'Yes, proceed to delete',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
