// Задание 2
import 'dart:math';

import 'package:flutter/material.dart';

class ProgressIndicatorPage extends StatelessWidget {
  const ProgressIndicatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ProgressIndicator(color: Colors.blue),
      ),
    );
  }
}

class ProgressIndicator extends StatefulWidget {
  final Color color;

  const ProgressIndicator({super.key, required this.color});

  @override
  State<ProgressIndicator> createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller, 
            curve: Curves.easeInOut,
          ),
        ),
        child: Stack(
          children: List.generate(8, (index) {
            final angle = 2 * index * pi / 8;
            return Positioned(
              left: 40 * (1 - 0.5 * (1 - cos(angle))),
              top: 40 * (1 - 0.5 * (1 - sin(angle))),
              child: ScaleTransition(
                scale: TweenSequence([
                  TweenSequenceItem(
                    tween: Tween(begin: 0.5, end: 1.25)
                        .chain(CurveTween(curve: Curves.linear)), 
                    weight: 50,
                  ), 
                  TweenSequenceItem(
                    tween: Tween(begin: 1.25, end: 0.5)
                        .chain(CurveTween(curve: Curves.linear)), 
                    weight: 50,
                  ),
                ]).animate(
                  CurvedAnimation(
                    parent: _controller, 
                    curve: Interval(
                      max(index - 3, 0) / 8, 
                      min(index + 4, 8) / 8, 
                      curve: Curves.easeOut,
                    ),
                  ),
                ),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    color: widget.color,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
