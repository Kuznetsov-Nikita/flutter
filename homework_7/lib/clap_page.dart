// Задание 3
import 'dart:math';

import 'package:flutter/material.dart';

class ClapPage extends StatefulWidget {
  const ClapPage({super.key});

  @override
  State<ClapPage> createState() => _ClapPageState();
}

class _ClapPageState extends State<ClapPage> with TickerProviderStateMixin {
  int _clapCount = 0;
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                bool shouldPaint = false;
                if (_controller.status == AnimationStatus.forward) {
                  shouldPaint = true;
                }
                return CustomPaint(
                  painter: ParticlesPainter(
                    controller: _controller,
                    shouldPaint: shouldPaint
                  ),
                  child: child,
                );
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    _clapCount == 0 ? '0' : '+$_clapCount', 
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: () => setState(() {
                ++_clapCount;
                _controller.forward(from: 0);
              }), 
              padding: const EdgeInsets.all(20),
              icon: const Icon(
                Icons.waving_hand_outlined, 
                size: 60, 
                color: Colors.red,
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<CircleBorder>(
                  const CircleBorder(
                    side: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParticlesPainter extends CustomPainter {
  final AnimationController controller;
  final bool shouldPaint;
  final int particlesCount;

  const ParticlesPainter({
    required this.controller, 
    required this.shouldPaint,
    this.particlesCount = 10,
  }): super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    if (shouldPaint) {
      canvas.translate(size.width / 2, size.height / 2);

      canvas.save();
      for (int i = 0; i < particlesCount; ++i) {
        _paintParticle(canvas, controller.value);
        canvas.rotate(2 * pi / 10);
      }
      canvas.restore();
    }
  }

  void _paintParticle(Canvas canvas, double progress) {
    canvas.save();

    final offsetTween = Tween<Offset>(
      begin: const Offset(0, 50), 
      end: const Offset(0, 150),
    );
    canvas.translate(offsetTween.lerp(progress).dx, offsetTween.lerp(progress).dy);

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(20, 20);
    path.lineTo(20, 0);
    path.close();
    
    canvas.drawPath(path, Paint()..color = Colors.yellow.withOpacity(1 - progress));
    
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => shouldPaint;
}
