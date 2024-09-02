import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final Function() refresh;
  
  const FailureWidget({super.key, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: () => refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Text(
                'Загрузка не удалась, нажмите, чтобы повторить попытку',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
