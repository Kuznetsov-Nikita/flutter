import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeftNavigationWidget extends StatelessWidget {
  const LeftNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      minWidth: 50,
      selectedIndex: 0,
      backgroundColor: const Color(0xfff1e2c3),
      destinations: [
        NavigationRailDestination(
          label: Text(AppLocalizations.of(context)!.institutions),
          icon: const Icon(Icons.local_bar),
          selectedIcon: const Icon(Icons.local_bar, color: Colors.deepPurple),
        ),
        NavigationRailDestination(
          label: Text(AppLocalizations.of(context)!.hotels),
          icon: const Icon(Icons.hotel),
          selectedIcon: const Icon(Icons.hotel, color: Colors.deepPurple),
        ),
        NavigationRailDestination(
          label: Text(AppLocalizations.of(context)!.beaches),
          icon: const Icon(Icons.beach_access),
          selectedIcon: const Icon(Icons.beach_access, color: Colors.deepPurple),
        ),
      ],
    );
  }
}
