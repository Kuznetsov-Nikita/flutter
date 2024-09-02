import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xfff1e2c3),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.local_bar),
          label: AppLocalizations.of(context)!.institutions,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.hotel),
          label: AppLocalizations.of(context)!.hotels,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.beach_access),
          label: AppLocalizations.of(context)!.beaches,
        ),
      ],
    );
  }
}
