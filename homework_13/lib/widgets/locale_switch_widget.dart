import 'package:flutter/material.dart';

class LocaleSwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;

  const LocaleSwitchWidget({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value ? 'ENG' : 'RU', 
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Switch(
              value: value, 
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
